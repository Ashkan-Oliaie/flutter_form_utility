import 'package:form_utility/src/fields/fields.dart';

/// An interface that provides utility methods for form management.
/// It is used to register, update form fields.
mixin IFormUtility<F extends IField> {
  void registerField(F field);
  void updateField(String key, value);
}
