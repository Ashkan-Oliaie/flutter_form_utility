import 'base_input.dart';

class TextInput<T> extends BaseInput<T> {
  TextInput({
    required super.name,
    required super.label,
    super.initialValue,
    super.generateCustomValidators,
    super.validators,
    super.isRequired,
    super.hotErrorEnabled,
  });
}
