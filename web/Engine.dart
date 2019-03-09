import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'Snake.dart';
import 'Renderer.dart';
import 'Keyboard.dart';
import 'State.dart';

class Engine {
  static const num GAME_SPEED = 50;
  num _lastTimestamp = 0;
  int _rightEdgeX;
  int _bottomEdgeY;
  Snake _snake;
  Point _food;
  Renderer _renderer;
  State _state;

  Engine(Renderer renderer) {
    _renderer = renderer;
    Keyboard();
    _rightEdgeX = renderer.width ~/ renderer.cellSeize;
    _bottomEdgeY = renderer.height ~/ renderer.cellSeize;
    init();
  }

  void init() {
    _state = State();
    _snake = new Snake(_renderer);
    _food = _randomPoint();
  }

  Point _randomPoint() {
    Random random = new Random();
    return new Point(random.nextInt(_rightEdgeX), random.nextInt(_bottomEdgeY));
  }

  void _checkForCollisions() {
    if (_snake.head == _food) {
      _snake.grow();
      _food = _randomPoint();
      _state.eatFood();
    }

    if (_snake.head.x <= -1 ||
        _snake.head.x >= _rightEdgeX ||
        _snake.head.y <= -1 ||
        _snake.head.y >= _bottomEdgeY ||
        _snake.checkForBodyCollision()) {
      init();
    }
  }

  Future run() async {
    update(await window.animationFrame);
  }

  void update(num delta) {
    final num diff = delta - _lastTimestamp;

    if (diff > GAME_SPEED) {
      _lastTimestamp = delta;
      _renderer.clear();
      _renderer.drawCell(_food, 'blue');
      _renderer.drawState(_state);
      _snake.update();
      _checkForCollisions();
    }
    run();
  }
}