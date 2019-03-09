import 'dart:html';
import 'dart:math';
import 'State.dart';

class Renderer {
  CanvasElement canvas;
  CanvasRenderingContext2D ctx2D;
  static const int CELL_SIZE = 10;
  HtmlElement score;
  HtmlElement time;

  Renderer(String querySelector) {
    canvas = document.querySelector(querySelector)..focus();
    ctx2D = canvas.getContext('2d');
    score = document.querySelector('#score');
    time = document.querySelector('#time');
  }

  void drawCell(Point coords, String color) {
    ctx2D
      ..fillStyle = color
      ..strokeStyle = '#eee';

    final int x = coords.x * CELL_SIZE;
    final int y = coords.y * CELL_SIZE;

    ctx2D
      ..fillRect(x, y, CELL_SIZE, CELL_SIZE)
      ..strokeRect(x, y, CELL_SIZE, CELL_SIZE);
  }

  void drawState(State state) {
    score.setInnerHtml(state.score.toString());
    time.setInnerHtml(state.timeElapsed.inSeconds.toString());
  }

  void clear() {
    ctx2D
      ..fillStyle = '#eee'
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  int get width => canvas.width;
  int get height => canvas.height;
  int get cellSeize => CELL_SIZE;
}
