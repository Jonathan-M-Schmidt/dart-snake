import 'dart:html';
import 'dart:collection';

class Keyboard {
  HashMap<int, num> _keys = HashMap<int, num>();

  Keyboard() {
    window.onKeyDown.listen((KeyboardEvent event) {
      _keys.putIfAbsent(event.keyCode, () => event.timeStamp);
    });

    window.onKeyUp.listen((KeyboardEvent event) {
      _keys.remove(event.keyCode);
    });
  }

  bool isPressed(int keyCode) => _keys.containsKey(keyCode);
}
