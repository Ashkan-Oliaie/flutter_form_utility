import 'package:form_utility/src/inputs/base_input.dart';
import 'package:form_utility/src/validators/validators.dart';

/// A mixin that provides utility methods for form management.
///
/// This mixin is intended to be used with classes that represent forms.
/// It provides methods for registering and unregistering form fields,
/// updating field values, disabling fields, validating individual fields,
/// validating all fields, and retrieving error messages.
///
/// The type parameter `F` should be a subclass of `BaseInput`.
mixin FormUtils<F extends BaseInput> {
  final Map<String, F> _formFields = {};

  void registerField(F field) {
    _formFields[field.name] = field;
    field.value = field.initialValue;
    _setFieldValidators(field);
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

  dynamic getValue(String key) => _formFields[key]?.value;

  F? getField(String name) => _formFields[name];

  String? validateField(String key) {
    final field = _formFields[key];
    final value = field?.value;
    final validators = field?.validators ?? [];
    for (var validator in validators) {
      if (value == null) {
        if (validator is RequiredValidator) return '${field?.name} is required';
      } else {
        if (validator.validation?.call(value) == false) {
          return validator.displayedError;
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

  Map<String, String?> getErrorMessages() =>
      _formFields.map((key, field) => MapEntry(key, field.error));

  void _setFieldValidators(F field) {
    if (field.isRequired) {
      field.validators.insert(0, RequiredValidator(fieldName: field.name));
    }
    final customValidators = field.generateCustomValidators?.call(_formFields);
    field.addValidators([...?customValidators]);
  }
}
