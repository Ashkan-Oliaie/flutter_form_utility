/// A class that represents a base validator.
///
/// This class contains the common properties and methods that any validator would have.
/// It is meant to be extended by other classes to create specific types of validators.
class BaseValidator {
  BaseValidator({
    required this.errorMessage,
    this.validation,
    this.fieldName,
  });
  final String errorMessage;
  final String? fieldName;
  final bool Function(String)? validation;

  /// Returns the error message to be displayed.
  String get displayedError =>
      fieldName != null ? '$fieldName $errorMessage' : errorMessage;

  /// Checks if the value is valid.
  bool isValid(dynamic value) =>
      value != null && validation?.call(value) == true;
}
