import 'package:form_utility/src/fields/fields.dart';

/// An interface for input fields.
///
/// This interface provides methods for updating field values, validating fields,
/// adding validators, and disabling fields. It also contains properties for
/// the field name, label, initial value, validators, and whether the field is required.
class ChoiceField<T> extends BaseField<T> {
  ChoiceField({
    required this.choices,
    required super.name,
    super.initialValue,
    super.generateCustomValidators,
    super.validators,
    super.isRequired,
    super.hotErrorEnabled,
  });

  List<T> choices;
}
