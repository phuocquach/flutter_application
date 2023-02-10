import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/global/global_game_reference.dart';
import 'package:flutter_application/utils/game_methods.dart';
import '../global/player_data.dart';

class PlayerComponent extends SpriteAnimationComponent {
  static double speed = 2;
  late SpriteSheet playerWalkingSprintSheet;
  late SpriteSheet playerIdleSprintSheet;
  final Vector2 playerDimension = Vector2.all(60);
  late SpriteAnimation walkingAnimation =
      playerWalkingSprintSheet.createAnimation(row: 0, stepTime: 0.1);
  late SpriteAnimation idleAnimation =
      playerIdleSprintSheet.createAnimation(row: 0, stepTime: 0.2);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    playerWalkingSprintSheet = SpriteSheet(
        image: await Flame.images
            .load("sprite_sheets/player/player_walking_sprite_sheet.png"),
        srcSize: playerDimension);
    playerIdleSprintSheet = SpriteSheet(
        image: await Flame.images
            .load("sprite_sheets/player/player_idle_sprite_sheet.png"),
        srcSize: playerDimension);

    animation = idleAnimation;
    size = Vector2(60, 60);
    position = Vector2(100, 300);
    priority = 100;
    anchor = Anchor.bottomCenter;
  }

  @override
  void update(double dt) {
    super.update(dt);
    movingPlayer();
  }

  void movingPlayer() {
    var playerData =
        GlobalGameReference.instance.gameReference.worldData.playerData;
    if (playerData.componentMotionState == ComponentMotionState.walkingLeft) {
      position.x -= speed;
      if (playerData.componentDirectionState != ComponentDirectionState.right) {
        flipHorizontallyAroundCenter();
        playerData.componentDirectionState = ComponentDirectionState.right;
      }
      animation = walkingAnimation;
    } else if (playerData.componentMotionState ==
        ComponentMotionState.walkingRight) {
      position.x += speed;
      if (playerData.componentDirectionState != ComponentDirectionState.left) {
        flipHorizontallyAroundCenter();
        playerData.componentDirectionState = ComponentDirectionState.left;
      }
      animation = walkingAnimation;
    } else {
      animation = idleAnimation;
    }
  }

  @override
  void onGameResize(Vector2 newSize) {
    super.onGameResize(newSize);
    size = GameMethods.instance.blockSize * 1.5;
  }
}
