import 'package:form_utility/src/inputs/inputs.dart';

class ChoiceInput<T> extends BaseInput<T> {
  ChoiceInput({
    required this.choices,
    required super.name,
    required super.label,
    super.initialValue,
    super.generateCustomValidators,
    super.validators,
    super.isRequired,
    super.hotErrorEnabled,
  });

  List<T> choices;
}
