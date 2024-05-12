import 'package:form_utility/src/fields/fields.dart';
import 'package:form_utility/src/validators/validators.dart';

/// A base class for input fields.
///
/// This class extends `IInput` and provides a concrete implementation of its methods.
/// It also contains additional properties for whether the field has been touched,
/// whether the field is disabled, and the field's error message.
class BaseField<T> extends IField<T> {
  BaseField({
    required super.name,
    super.initialValue,
    super.generateCustomValidators,
    super.validators,
    super.isRequired = false,
    super.hotErrorEnabled = false,
  }) {
    value = initialValue;
    if (isRequired) validators.insert(0, RequiredValidator(fieldName: name));
  }

  /// Disables the field.
  @override
  void disable(bool status) => isDisabled = status;

  /// Adds validators to the field.
  @override
  List<BaseValidator> addValidators(List<BaseValidator> validators) {
    this.validators.addAll(validators);
    return this.validators;
  }

  /// Updates the value of the field.
  @override
  void updateValue(T? value) {
    this.value = value;
    isTouched = true;
    if (hotErrorEnabled) validateField();
  }

  /// Validates the field.
  @override
  void validateField() {
    error = null;
    for (var validator in validators) {
      if (!validator.isValid(value)) error ??= validator.displayedError;
    }
  }

  /// Checks if the field's value has been modified.
  bool get isModified => value != initialValue;
}
