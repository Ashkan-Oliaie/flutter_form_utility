import 'package:form_utility/form_utility.dart';

mixin FormBuilder<T> {
  List<IField> fields = [];
  final eventBus = EventBus();

  void startBuilder({Function(List<IField> fields)? onChange}) {
    eventBus.on<RegisterFieldEvent<T>>((event) {
      fields.add(event.field);
      onChange!(fields);
    });

    eventBus.on<UnRegisterFieldEvent<T>>((event) {
      fields.removeWhere((f) => f.name == event.name);
      onChange!(fields);
    });

    eventBus.on<AddErrorEvent<T>>((event) {
      final oldError =
          fields.firstWhere((element) => element.name == event.name).error;

      if (oldError != event.error) {
        onChange!(fields);
      }
    });

    eventBus.on<UpdateFieldsEvent<T>>((event) {
      fields = event.fields;
      onChange!(fields);
    });
  }
}
