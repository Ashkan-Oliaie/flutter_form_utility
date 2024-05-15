# Form Utility

## Description

"This package provides a set of utilities to simplify form handling in Flutter. It includes classes for form fields and validations, as well as a mixin for form management. The package is designed to be flexible and extensible, allowing you to define your own form fields and validations as needed."
## Installation

To use this package, add `form_utility` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).


## Usage
To use this package, first of all you add the `FormUtility` to where you need the functionalities. 

Then you can register your fields and validations with the `FormUtility` mixin. The `FormUtility` mixin provides methods for registering fields and validations, as well as for validating the form and accessing the form data.

```dart
registerField(
  InputField(
    name: 'EmailFieldKey',
    isRequired: true,
    validators: [EmailValidator()],
  ),
);
```
Now you have control over the fields, and you can validate them however you want.

You can even benefit from cross-field validation.

```dart
registerField(
  InputField(
    name: 'ConfirmPasswordKey',
    generateCustomValidators: (formValues) {
      return [
        BaseValidator(
          errorMessage: 'Passwords do not match',
          validation: (value) => value == fields['PasswordKey']?.value,
        ),
      ];
    },
  ),
);
```

You can use the predefined validators or create your own extending `BaseValidator`.

```dart
class CustomValidator extends BaseValidator {
  ExactLengthValidator() : super(
    errorMessage: 'your error message',
    validation: (value) => 'your validation logic',
  );
}
```

The form can now get validated by calling the `validateForm` method. If you needed hot validation on a field, you need to register the field with 'hotErrorEnabled' set to true.

The error messaged are returned by the `validateForm` method. The `validateField` could also be used to validate a single field.


## Future plans

- [ ] Introduce more abstraction to allow better extendability and customization
- [ ] Implement dynamic custom inputs
- [ ] Implement predefined validators
- [ ] Implement extra frequently used fields
- [ ] Integrate into the UI
- [ ] Implement predefined UI components
- [ ] Introduce forms grouping