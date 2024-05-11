import 'package:form_utility/src/fields/fields.dart';
import 'package:form_utility/src/validators/validators.dart';

typedef GenerateValidationFunctionType = List<BaseValidator> Function(
    Map<String, IField> formValues)?;

enum FieldType {
  text,
  dropdown,
  checkbox,
  radio,
}
