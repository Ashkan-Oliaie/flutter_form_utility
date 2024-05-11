import 'package:form_utility/src/validators/validators.dart';

/// A class that represents a maximum length validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate the maximum length of a string.
class MaxLengthValidator extends BaseValidator {
  MaxLengthValidator(int maxLength, {super.fieldName})
      : super(
          errorMessage: 'max length is $maxLength',
          validation: (value) => value.length <= maxLength,
        );
}

/// A class that represents a minimum length validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate the minimum length of a string.
class MinLengthValidator extends BaseValidator {
  MinLengthValidator(int minLength, {super.fieldName})
      : super(
          errorMessage: 'min length is $minLength',
          validation: (value) => value.length >= minLength,
        );
}

/// A class that represents an email validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate email addresses.
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

/// A class that represents a required field validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate that a field is not empty.
class RequiredValidator extends BaseValidator {
  RequiredValidator({super.fieldName})
      : super(
          errorMessage: 'field is required',
          validation: (value) => value.isNotEmpty,
        );
}

/// A class that represents a regex validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate a string against a regular expression.
class RegexValidator extends BaseValidator {
  final String regex;

  RegexValidator(this.regex, {super.fieldName, required super.errorMessage})
      : super(
          validation: (value) => RegExp(regex).hasMatch(value),
        );
}

/// A class that represents a length validator.
///
/// This class extends the [BaseValidator] class and is specifically designed to validate the length of a string.
class ExactLengthValidator extends BaseValidator {
  ExactLengthValidator(int length, {super.fieldName})
      : super(
          errorMessage: 'must be $length characters long',
          validation: (value) => value.length == length,
        );
}
