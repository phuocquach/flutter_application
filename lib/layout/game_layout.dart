import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/global/world_data.dart';
import 'package:flutter_application/layout/controller_widget.dart';

import '../main_game.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GameWidget(game: MainGame(worldData: WorldData())),
        const ControllerLayout(),
      ],
    );
  }
}
