class BaseValidator {
  BaseValidator({
    required this.errorMessage,
    this.validation,
    this.fieldName,
  });
  final String errorMessage;
  final String? fieldName;
  final bool Function(String)? validation;

  String displayedError() {
    return fieldName != null ? '$fieldName $errorMessage' : errorMessage;
  }
}
