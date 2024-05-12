import 'package:form_utility/src/types.dart';
import 'package:form_utility/src/validators/base_validator.dart';

/// An interface for input fields.
///
/// This interface provides methods for updating field values, validating fields,
/// adding validators, and disabling fields. It also contains properties for
/// the field name, initial value, validators, and whether the field is required.
abstract class IField<T> {
  void updateValue(T? value);
  void validateField();
  List<BaseValidator> addValidators(List<BaseValidator> validators);
  void disable(bool status);

  IField({
    required this.name,
    this.initialValue,
    this.generateCustomValidators,
    this.isRequired = false,
    this.hotErrorEnabled = false,
    List<BaseValidator>? validators,
  }) : validators = validators ?? [];

  final String name;
  final T? initialValue;
  final GenerateValidationFunctionType generateCustomValidators;
  final bool isRequired;
  List<BaseValidator> validators = [];
  bool hotErrorEnabled = false;

  T? value;
  bool isTouched = false;
  bool isDisabled = false;
  String? error;
}
