import 'package:form_utility/form_utility.dart';

abstract class BaseEvent<T> {}

class RegisterFieldEvent<T> extends BaseEvent<T> {
  final IField field;

  RegisterFieldEvent(this.field);
}

class UnRegisterFieldEvent<T> extends BaseEvent<T> {
  final String name;

  UnRegisterFieldEvent(this.name);
}

class UpdateFieldsEvent<T> extends BaseEvent<T> {
  final List<IField> fields;

  UpdateFieldsEvent(this.fields);
}

class AddErrorEvent<T> extends BaseEvent<T> {
  final String name;
  final String? error;

  AddErrorEvent(this.name, this.error);
}
