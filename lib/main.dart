import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componets/Galinha.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/anchor.dart';
import 'package:flame/text_config.dart';

import 'componets/Ovo.dart';
import 'componets/Background.dart';
import 'package:flame/gestures.dart';

var game;
TextComponent textScore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(
      ['bg.png', 'galinha_direita.png', 'galinha_esquerda.png', 'ovo.png']);
  var dimensions = await Flame.util.initialDimensions();
  game = JogoBase(dimensions);

  runApp(game.widget);
}

Ovo ovo;
List<Ovo> ovoList;
BackgroundGame background;

class JogoBase extends BaseGame with TapDetector {
  Size dimensions;
  Galinha galinha;

  JogoBase(this.dimensions) {
    ovoList = <Ovo>[];
    galinha = new Galinha();
    background = new BackgroundGame(this.dimensions);
    add(background);

    textScore = TextComponent('Score: ${galinha.score}',
        config: TextConfig(color: Colors.black))
      ..anchor = Anchor.topCenter
      ..x = dimensions.width - 100
      ..y = 32.0;
    add(textScore);
  }

  double creationTimer = 0.0;
  bool bg = false;
  bool criaGalinha = false;
  @override
  void update(double t) {
    textScore.text = 'Score: ${galinha.score}';

    // if (!bg) {
    //   add(background);
    //   bg = true;
    // }

    if (!criaGalinha) {
      criaGalinha = true;
      add(galinha);
    }

    creationTimer += t;
    if (creationTimer >= 1) {
      creationTimer = 0.0;

      ovo = new Ovo(dimensions, galinha);
      ovoList.add(ovo);
      add(ovo);
    }

    // print('Placar: $points');
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    galinha.position = details.globalPosition.dx;
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }
}
