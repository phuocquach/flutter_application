import 'package:flame/game.dart';
import 'package:flutter_application/components/block_component.dart';
import 'package:flutter_application/components/player.dart';
import 'package:flutter_application/global/global_game_reference.dart';
import 'package:flutter_application/global/world_data.dart';
import 'package:flutter_application/resoures/blocks.dart';
import 'package:flutter_application/utils/chunk_generation_method.dart';
import 'package:get/get.dart';

class MainGame extends FlameGame {
  final WorldData worldData;

  MainGame({required this.worldData}) {
    globalGameReference.gameReference = this;
  }

  GlobalGameReference globalGameReference = Get.put(GlobalGameReference());
  PlayerComponent playerComponent = PlayerComponent();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.followComponent(playerComponent);
    add(playerComponent);
    renderChunk(ChunkGenerationMethod.instance.generateChunk());
  }

  void renderChunk(List<List<Blocks?>> chunk) {
    chunk.asMap().forEach((yIndex, rowOfBlocks) {
      rowOfBlocks.asMap().forEach((xIndex, block) {
        if (block != null) {
          add(BlockComponent(
              block: block,
              blockPosition: Vector2(xIndex.toDouble(), yIndex.toDouble())));
        }
      });
    });
  }
}
