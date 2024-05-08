import 'base_input.dart';

class TextInput<T> extends BaseInput<T> {
  TextInput({
    required super.name,
    super.initialValue,
    super.generateValidations,
    super.isRequired,
    super.hotErrorEnabled,
  });
}
