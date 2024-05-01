
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fluppy_bird/game/assets.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FluppyBirdGame>{
  Background();

  @override
  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
    return super.onLoad();
  }
}