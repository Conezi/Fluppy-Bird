import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:fluppy_bird/game/assets.dart';
import 'package:fluppy_bird/game/configuration.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';

class Ground extends ParallaxComponent<FluppyBirdGame> with HasGameRef<FluppyBirdGame>{

  @override
  Future<void> onLoad() async{
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none)
      )
    ]);

    add(RectangleHitbox(position: Vector2(0, gameRef.size.y - Config.groundHeight),
        size: Vector2(gameRef.size.x, Config.groundHeight )));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Config.gameSpeed;
    super.update(dt);
  }
}