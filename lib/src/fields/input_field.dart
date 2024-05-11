import 'base_field.dart';

/// Represents an input field in a form.
///
/// This class extends [BaseField] and represents a basic text field.
class InputField<T> extends BaseField<T> {
  InputField({
    required super.name,
    super.initialValue,
    super.generateCustomValidators,
    super.validators,
    super.isRequired,
    super.hotErrorEnabled,
  });
}
