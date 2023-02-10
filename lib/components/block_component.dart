import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter_application/utils/game_methods.dart';

import '../resoures/blocks.dart';

class BlockComponent extends SpriteComponent {
  final Blocks block;
  final Vector2 blockPosition;
  BlockComponent({required this.block, required this.blockPosition});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = GameMethods.instance.blockSize;
    sprite = await GameMethods.instance.getSprite(block);
    position = Vector2(GameMethods.instance.blockSize.x * blockPosition.x,
        GameMethods.instance.blockSize.y * blockPosition.y);
  }

  @override
  void onGameResize(Vector2 newSize) {
    super.onGameResize(newSize);
    size = GameMethods.instance.blockSize;
    position = Vector2(GameMethods.instance.blockSize.x * blockPosition.x,
        GameMethods.instance.blockSize.y * blockPosition.y);
  }
}
