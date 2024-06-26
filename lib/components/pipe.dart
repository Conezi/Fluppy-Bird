import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fluppy_bird/game/assets.dart';
import 'package:fluppy_bird/game/configuration.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';
import 'package:fluppy_bird/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FluppyBirdGame>{
  Pipe({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async{
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch(pipePosition){
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
    }

    add(RectangleHitbox());
    return super.onLoad();
  }
}