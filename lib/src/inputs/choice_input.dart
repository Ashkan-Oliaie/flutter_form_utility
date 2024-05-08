import 'package:form_utility/src/inputs/inputs.dart';

class ChoiceInput<T> extends BaseInput<T> {
  ChoiceInput({
    required this.choices,
    required super.name,
    super.initialValue,
    super.generateValidations,
    super.isRequired,
    super.hotErrorEnabled,
  });

  List<T> choices;
}
