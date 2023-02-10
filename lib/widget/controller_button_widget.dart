import 'package:flutter/material.dart';
import 'package:flutter_application/global/global_game_reference.dart';
import 'package:flutter_application/global/player_data.dart';

class ControllerButton extends StatefulWidget {
  final String path;
  final VoidCallback onTapped;

  const ControllerButton({
    super.key,
    required this.path,
    required this.onTapped,
  });

  @override
  State<ControllerButton> createState() => _ControllerButtonState();
}

class _ControllerButtonState extends State<ControllerButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          widget.onTapped();
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          GlobalGameReference.instance.gameReference.worldData.playerData
              .componentMotionState = ComponentMotionState.idle;
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },
        child: Opacity(
          opacity: isPressed == true ? 0.5 : 0.8,
          child: SizedBox(
            height: screenSize.height / 17,
            width: screenSize.width / 17,
            child: Image.asset(widget.path),
          ),
        ),
      ),
    );
  }
}
