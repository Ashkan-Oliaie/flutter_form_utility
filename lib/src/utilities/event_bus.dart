class EventBus {
  final Map<Type, List<Function>> _listeners = {};

  static final EventBus _singleton = EventBus._internal();

  factory EventBus() {
    return _singleton;
  }

  EventBus._internal();

  void on<T>(void Function(T) callback) {
    if (!_listeners.containsKey(T)) {
      _listeners[T] = [];
    }
    _listeners[T]!.add(callback);
  }

  void dispatch<T>(T event) {
    final List<Function>? callbacks = _listeners[T];

    if (callbacks != null) {
      for (final Function callback in callbacks) {
        callback(event);
      }
    }
  }

  void off<T>(Function(T) callback) {
    _listeners[T]?.remove(callback);
  }
}
