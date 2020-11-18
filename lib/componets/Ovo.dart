import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componets/Galinha.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class Ovo extends SpriteComponent {
  Size dimensions;
  Random random = new Random();
  bool remove = false;

  Galinha galinha;
  bool destroyEgg = false;

  Ovo(this.dimensions, this.galinha) : super.square(ComponentSize, 'ovo.png');

  @override
  void update(double t) {
    super.update(t);
    this.y += t * SPEED;

    if (galinha != null) {
      bool remove = this.toRect().contains(galinha.toRect().bottomCenter) ||
          this.toRect().contains(galinha.toRect().bottomLeft) ||
          this.toRect().contains(galinha.toRect().bottomRight) ||
          this.toRect().contains(galinha.toRect().topCenter);
      if (remove) {
        destroyEgg = true;
        galinha.score++;
      }
    }
  }

  @override
  bool destroy() {
    return destroyEgg;
  }

  @override
  void resize(Size size) {
    var positionX = random.nextDouble();
    print(positionX);

    this.x = positionX * 300;
    this.y = 0;
  }
}
