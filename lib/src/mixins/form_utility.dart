import 'package:form_utility/form_utility.dart';

mixin FormUtility<F extends IField> implements IFormUtility<F> {
  final Map<String, F> _fields = {};

  /// Registers a field in the form.
  @override
  void registerField(F field) {
    _fields[field.name] = field;
    _setCustomValidators(field);
  }

  /// Unregisters a field from the form.
  void unregisterField(String name) => _fields.remove(name);

  /// Updates the value of a field in the form.
  @override
  void updateField(String name, value) {
    final field = getField(name);
    field.updateValue(value);
  }

  /// Validates all fields in the form.
  Map<String, String?> validateForms() {
    _fields.forEach((key, field) {
      if (!field.isDisabled) field.validateField();
    });
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
  F getField(String name) {
    if (!_fields.containsKey(name)) {
      throw Exception('Field with name $name does not exist');
    }
    return _fields[name]!;
  }

  /// Sets custom validators for a field in the form.
  void _setCustomValidators(F field) {
    final customValidators = field.generateCustomValidators?.call(_fields);
    field.addValidators([...?customValidators]);
  }
}
