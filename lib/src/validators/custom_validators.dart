import 'package:form_utility/src/validators/validators.dart';

class MaxLengthValidator extends BaseValidator {
  MaxLengthValidator(int maxLength, {super.fieldName})
      : super(
          errorMessage: 'max length is $maxLength',
          validation: (value) => value.length <= maxLength,
        );
}

class MinLengthValidator extends BaseValidator {
  MinLengthValidator(int minLength, {super.fieldName})
      : super(
          errorMessage: 'min length is $minLength',
          validation: (value) => value.length >= minLength,
        );
}

class EmailValidator extends BaseValidator {
  EmailValidator({super.fieldName})
      : super(
          errorMessage: 'Email address is not valid',
          validation: (value) {
            final emailRegex = RegExp(
                r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
            return emailRegex.hasMatch(value);
          },
        );
}

class RequiredValidator extends BaseValidator {
  RequiredValidator({super.fieldName})
      : super(
          errorMessage: 'field is required',
          validation: (value) => value.isNotEmpty,
        );
}

class RegexValidator extends BaseValidator {
  final String regex;

  RegexValidator(this.regex, {super.fieldName, required super.errorMessage})
      : super(
          validation: (value) => RegExp(regex).hasMatch(value),
        );
}
