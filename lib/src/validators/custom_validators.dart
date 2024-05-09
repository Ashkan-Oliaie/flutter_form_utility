import 'package:form_utility/src/validators/validators.dart';

class MaxLengthValidation extends BaseValidation {
  MaxLengthValidation(int maxLength, {super.fieldName})
      : super(
          errorMessage: 'max length is $maxLength',
          validation: (value) => value.length <= maxLength,
        );
}

class MinLengthValidation extends BaseValidation {
  MinLengthValidation(int minLength, {super.fieldName})
      : super(
          errorMessage: 'min length is $minLength',
          validation: (value) => value.length >= minLength,
        );
}

class EmailValidation extends BaseValidation {
  EmailValidation({super.fieldName})
      : super(
          errorMessage: 'Email address is not valid',
          validation: (value) {
            final emailRegex = RegExp(
                r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
            return emailRegex.hasMatch(value);
          },
        );
}

class RequiredValidation extends BaseValidation {
  RequiredValidation({super.fieldName})
      : super(
          errorMessage: 'field is required',
          validation: (value) => value.isNotEmpty,
        );
}

class RegexValidation extends BaseValidation {
  final String regex;

  RegexValidation(this.regex, {super.fieldName})
      : super(
          errorMessage: "field doesn't match the pattern",
          validation: (value) => RegExp(regex).hasMatch(value),
        );
}
