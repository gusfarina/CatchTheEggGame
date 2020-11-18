// import 'package:flutter/material.dart';
// import 'package:flame/components/component.dart';
// import 'package:game_base/componets/Ovo.dart';
// import 'package:game_base/main.dart';

// const SPEED = 150.0;

// class Bomb extends SpriteComponent {
//   Offset initialDirection = new Offset(200, 300);
//   List<Ovo> ovoList;
//   bool destroyBomb = false;

//   Bomb(this.initialDirection, this.ovoList) : super.square(30.0, 'bomb.png');

//   @override
//   void update(double t) {
//     super.update(t);
//     this.y -= t * SPEED;

//     if (ovoList.isNotEmpty) {
//       ovoList.forEach((dragon) {
//         if (!dragon.remove) {
//           bool remove = this.toRect().contains(dragon.toRect().bottomCenter) ||
//               this.toRect().contains(dragon.toRect().bottomLeft) ||
//               this.toRect().contains(dragon.toRect().bottomRight);
//           if (remove) {
//             dragon.remove = true;
//             destroyBomb = true;
//             points += 1;
//           }
//         }
//       });
//     }
//   }

//   @override
//   bool destroy() {
//     return destroyBomb;
//   }

//   @override
//   void resize(Size size) {
//     this.x = this.initialDirection.dx - 15;
//     this.y = size.height - 80;
//   }
// }
