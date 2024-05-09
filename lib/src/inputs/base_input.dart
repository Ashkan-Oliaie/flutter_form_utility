import 'package:form_utility/src/validators/validators.dart';

import '../types.dart';

abstract class BaseInput<T> {
  BaseInput({
    required this.name,
    this.initialValue,
    this.generateValidations,
    this.isRequired = false,
    this.hotErrorEnabled = false,
  });

  final String name;
  final T? initialValue;
  final GenerateValidationFunctionType generateValidations;
  final bool isRequired;

  T? value;
  bool isTouched = false;
  bool _isDisabled = false;
  bool hotErrorEnabled = false;
  String? error;
  List<BaseValidation> validations = [];

  bool get isDisabled => _isDisabled;

  void disable(bool status) => _isDisabled = status;
}
