import 'package:form_utility/src/inputs/inputs.dart';
import 'package:form_utility/src/validators/validators.dart';

typedef GenerateValidationFunctionType = List<BaseValidator> Function(Map<String, BaseInput> formValues)?;

enum FieldType {
  text,
  dropdown,
  checkbox,
  radio,
}
