import 'package:form_utility/form_utility.dart';

mixin FormUtility<T> implements IFormUtility {
  final Map<String, IField> _fields = {};
  final eventBus = EventBus();

  /// Registers a field in the form.
  @override
  void registerField(IField field) {
    Future.delayed(Duration.zero, () {
      _fields[field.name] = field;
      _setCustomValidators(field);
      eventBus.dispatch(RegisterFieldEvent<T>(field));
    });
  }

  /// Unregisters a field from the form.
  void unregisterField(String name) {
    _fields.remove(name);
    eventBus.dispatch(UnRegisterFieldEvent<T>(name));
  }

  /// Updates the value of a field in the form.
  @override
  void updateField(String name, value) {
    final field = getField(name);
    field.updateValue(value);
    eventBus.dispatch(AddErrorEvent<T>(name, field.error));
  }

  /// Validates all fields in the form.
  Map<String, String?> validateForms() {
    _fields.forEach((key, field) {
      if (!field.isDisabled) field.validateField();
    });
    eventBus.dispatch(UpdateFieldsEvent<T>(_fields.values.toList()));
    return getErrorMessages();
  }

  /// Disables a field in the form.
  void disableField(String name, {bool status = false}) {
    final field = getField(name);
    field.disable(status);
  }

  /// Retrieves the value of a field in the form.
  dynamic getValue(String key) => _fields[key]?.value;

  /// Validates a field in the form.
  String? validateField(String name) {
    final field = getField(name);
    field.validateField();
    return field.error;
  }

  /// Retrieves error messages for all fields in the form.
  Map<String, String?> getErrorMessages() =>
      _fields.map((key, field) => MapEntry(key, field.error));

  /// Retrieves a field from the form.
  IField getField(String name) {
    if (!_fields.containsKey(name)) {
      throw Exception('Field with name $name does not exist');
    }
    return _fields[name]!;
  }

  /// Sets custom validators for a field in the form.
  void _setCustomValidators(IField field) {
    final customValidators = field.generateCustomValidators?.call(_fields);
    field.addValidators([...?customValidators]);
  }
}
