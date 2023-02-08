import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameWidget(game: MainGame()));
}
