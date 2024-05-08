import 'package:form_utility/src/validators/validators.dart';

class MaxLengthValidation extends BaseValidator {
  MaxLengthValidation(int maxLength, {super.fieldName})
      : super(
          errorMessage: 'max length is $maxLength',
          validation: (value) => value.length <= maxLength,
        );
}

class MinLengthValidation extends BaseValidator {
  MinLengthValidation(int minLength, {super.fieldName})
      : super(
          errorMessage: 'min length is $minLength',
          validation: (value) => value.length >= minLength,
        );
}

class EmailValidation extends BaseValidator {
  EmailValidation({super.fieldName})
      : super(
          errorMessage: 'Email address is not valid',
          validation: (value) {
            final emailRegex = RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
            return emailRegex.hasMatch(value);
          },
        );
}

class RequiredValidation extends BaseValidator {
  RequiredValidation({super.fieldName})
      : super(
          errorMessage: 'This field is required',
          validation: (value) => value.isNotEmpty,
        );
}
