import 'package:flame/components.dart';

import '../resoures/blocks.dart';
import 'constants.dart';

class ChunkGenerationMethod {
  static ChunkGenerationMethod get instance {
    return ChunkGenerationMethod();
  }

  List<Null> getNullRow() {
    return List.generate(chunkWidth, (index) => null);
  }

  List<List<Blocks?>> generateNullChunk() {
    return List.generate(
        chunkHeight, (index) => List.generate(chunkWidth, (index) => null));
  }

  List<List<Blocks?>> generateChunk() {
    List<List<Blocks?>> chunk = generateNullChunk();

    chunk.asMap().forEach((rowIndex, List<Blocks?> row) {
      if (rowIndex == 5) {
        row.asMap().forEach((int index, block) {
          chunk[5][index] = Blocks.grass;
        });
      }
      if (rowIndex >= 6) {
        row.asMap().forEach((int index, block) {
          chunk[rowIndex][index] = Blocks.dirt;
        });
      }
    });
    return chunk;
  }
}
