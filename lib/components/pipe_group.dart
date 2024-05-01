
 import 'dart:math';

import 'package:flame/components.dart';
import 'package:fluppy_bird/components/pipe.dart';
import 'package:fluppy_bird/game/configuration.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';
import 'package:fluppy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FluppyBirdGame>{
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround/4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(height: centerY - spacing/2, pipePosition: PipePosition.top),
      Pipe(height: heightMinusGround - (centerY + spacing / 2), pipePosition: PipePosition.bottom)
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;

    if(position.x < -50){
      removeFromParent();
    }
    super.update(dt);
  }
}