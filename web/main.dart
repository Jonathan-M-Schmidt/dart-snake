import 'dart:html';
import 'Renderer.dart';
import 'Engine.dart';

Renderer renderer;
HtmlElement startBtn;
HtmlElement stopBtn;
Engine engine;

void main() {
  startBtn = document.querySelector('#startBtn');
  stopBtn = document.querySelector('#stopBtn');
  startBtn.onClick.listen((e) => startGame(e));
  stopBtn.onClick.listen((e) => stopGame(e));
  renderer = Renderer('#canvas');
}

void startGame(e) {
  engine = Engine(renderer)..run();
}

void stopGame(e) {
  engine.stop();
  renderer.clear();
}
