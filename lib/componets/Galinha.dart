import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

const ComponentSize = 80.0;

class Galinha extends SpriteComponent {
  double position = 0.0;
  bool remove = false;
  int score = 0;

  Galinha() : super.square(ComponentSize, 'galinha_esquerda.png');

  @override
  void update(double t) {
    super.update(t);
    this.x = position - (ComponentSize / 2);
  }

  @override
  bool destroy() {
    return remove;
  }

  @override
  void resize(Size size) {
    this.x = size.width / 2 - (ComponentSize / 2);
    this.y = size.height - ComponentSize;
  }
}
