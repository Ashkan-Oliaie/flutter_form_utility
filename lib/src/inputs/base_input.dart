import 'package:form_utility/src/validators/validators.dart';

import '../types.dart';

abstract class BaseInput<T> {
  BaseInput({
    required this.name,
    required this.label,
    this.initialValue,
    this.generateCustomValidators,
    this.validators = const [],
    this.isRequired = false,
    this.hotErrorEnabled = false,
  });

  final String name;
  final String label;
  final T? initialValue;
  final GenerateValidationFunctionType generateCustomValidators;
  final bool isRequired;
  List<BaseValidator> validators;

  T? value;
  bool isTouched = false;
  bool _isDisabled = false;
  bool hotErrorEnabled = false;
  String? error;

  bool get isDisabled => _isDisabled;

  void disable(bool status) => _isDisabled = status;

  List<BaseValidator> addValidators(List<BaseValidator> validators) {
    this.validators.addAll(validators);
    return this.validators;
  }
}
