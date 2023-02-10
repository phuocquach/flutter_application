import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/global/global_game_reference.dart';
import 'package:flutter_application/global/player_data.dart';
import 'package:flutter_application/widget/controller_button_widget.dart';

class ControllerLayout extends StatelessWidget {
  const ControllerLayout({super.key});

  void onButtonTap() {
    log('a');
  }

  @override
  Widget build(BuildContext context) {
    PlayerData playerData =
        GlobalGameReference.instance.gameReference.worldData.playerData;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              path: "assets/controller/left_button.png",
              onTapped: () {
                playerData.componentMotionState =
                    ComponentMotionState.walkingLeft;
              },
            ),
            ControllerButton(
              path: "assets/controller/center_button.png",
              onTapped: () {
                playerData.componentMotionState = ComponentMotionState.idle;
              },
            ),
            ControllerButton(
              path: "assets/controller/right_button.png",
              onTapped: () {
                playerData.componentMotionState =
                    ComponentMotionState.walkingRight;
              },
            ),
          ],
        ),
      ),
    );
  }
}
