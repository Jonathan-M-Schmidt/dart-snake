import 'dart:html';
import 'dart:math';
import 'Keyboard.dart';
import 'Renderer.dart';

Keyboard keyboard = Keyboard();

class Snake {
  static const Point LEFT = const Point(-1, 0);
  static const Point RIGHT = const Point(1, 0);
  static const Point UP = const Point(0, -1);
  static const Point DOWN = const Point(0, 1);

  static const int START_LENGTH = 6;

  List<Point> _body;
  Point _dir = RIGHT;
  Renderer renderer;

  Snake(Renderer ren) {
    int i = START_LENGTH - 1;
    renderer = ren;
    _body = List<Point>.generate(START_LENGTH, (int index) {
      return new Point(i--, 0);
    });
  }

  Point get head => _body.first;

  void _checkInput() {
    if (keyboard.isPressed(KeyCode.LEFT) && _dir != RIGHT) {
      _dir = LEFT;
    } else if (keyboard.isPressed(KeyCode.RIGHT) && _dir != LEFT) {
      _dir = RIGHT;
    } else if (keyboard.isPressed(KeyCode.UP) && _dir != DOWN) {
      _dir = UP;
    } else if (keyboard.isPressed(KeyCode.DOWN) && _dir != UP) {
      _dir = DOWN;
    }
  }

  void grow() {
    _body.insert(0, head + _dir);
  }

  void _move() {
    grow();
    _body.removeLast();
  }

  void _draw() {
    for (Point p in _body) {
      renderer.drawCell(p, 'green');
    }
  }

  bool checkForBodyCollision() {
    for (Point p in _body.skip(1)) {
      if (p == head) {
        return true;
      }
    }
    return false;
  }

  void update() {
    _checkInput();
    _move();
    _draw();
  }
}
