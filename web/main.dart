import 'dart:html';
import 'Renderer.dart';
import 'Engine.dart';

Renderer renderer;
HtmlElement startBtn;
HtmlElement stopBtn;
HtmlElement pauseBtn;
Engine engine;

void main() {
  startBtn = document.querySelector('#startBtn');
  stopBtn = document.querySelector('#stopBtn');
  pauseBtn = document.querySelector('#pauseBtn');
  startBtn.onClick.listen((e) => startGame(e));
  stopBtn.onClick.listen((e) => stopGame(e));
  pauseBtn.onClick.listen((e) => togglePauseGame(e));
  renderer = Renderer('#canvas');
}

void startGame(e) {
  engine = Engine(renderer)..run();
}

void stopGame(e) {
  engine.stop();
  renderer.clear();
}

void togglePauseGame(e) {
  if (engine.isPaused) {
    engine.unPause();
  } else {
    engine.pause();
  }
}
