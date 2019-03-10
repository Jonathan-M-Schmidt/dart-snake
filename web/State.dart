class State {
  int _score;
  int _foodEaten;
  Stopwatch _stopwatch;

  State() {
    _score = 0;
    _foodEaten = 0;
    _stopwatch = Stopwatch()..start();
  }

  Duration get timeElapsed => _stopwatch.elapsed;

  void eatFood() {
    _foodEaten += 1;
    _score = (_foodEaten + (_score * 1.1)).round();
  }

  int get score => _score;

  void pause() {
    _stopwatch.stop();
  }

  void unPause() {
    _stopwatch.start();
  }
}
