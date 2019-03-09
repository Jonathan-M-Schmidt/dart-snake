import 'Renderer.dart';
import 'Engine.dart';

Renderer renderer;

void main() {
  renderer = Renderer('#canvas');
  Engine(renderer)..run();
}
