import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layout/game_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MaterialApp(
    home: GameLayout(),
  ));
}
