import 'package:form_utility/src/inputs/base_input.dart';
import 'package:form_utility/src/validators/validators.dart';

mixin FormUtils<F extends BaseInput> {
  final Map<String, F> _formFields = {};

  Map<String, F> get form => _formFields;

  void registerField(F field) {
    _formFields[field.name] = field;
    field.value = field.initialValue;
    field.validations = field.generateValidations?.call(_formFields) ?? [];
    if (field.isRequired) {
      _formFields[field.name]
          ?.validations
          .insert(0, RequiredValidation(fieldName: field.name));
    }
  }

  void unregisterField(String name) => _formFields.remove(name);

  void updateField(String key, value) {
    final field = _formFields[key];
    field?.value = value;
    field?.isTouched = true;
    if (field?.hotErrorEnabled == true) field?.error = validateField(key);
  }

  void disableField(String name, {bool status = false}) {
    final field = _formFields[name];
    field?.disable(status);
  }

  dynamic getField(String key) {
    return _formFields[key]?.value;
  }

  String? validateField(String key) {
    final field = _formFields[key];
    final value = field?.value;
    final validations = field?.validations;
    if (validations != null && value != null) {
      for (var validation in validations) {
        if (validation.validation?.call(value) == false) {
          return validation.displayedError();
        }
      }
    }
    return null;
  }

  Map<String, F> validateAllFields() {
    _formFields.forEach((key, field) {
      if (!field.isDisabled) _formFields[key]?.error = validateField(key);
    });
    return _formFields;
  }

  Map<String, String?> getErrorMessages() {
    return _formFields.map((key, field) => MapEntry(key, field.error));
  }
}
