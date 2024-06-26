import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:fluppy_bird/game/assets.dart';
import 'package:fluppy_bird/game/bird_movement.dart';
import 'package:fluppy_bird/game/configuration.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FluppyBirdGame>, CollisionCallbacks {
  Bird();

  @override
  Future<void> onLoad() async {
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.up: birdUpFlap,
      BirdMovement.middle: birdMidFlap,
      BirdMovement.down: birdDownFlap
    };

    add(CircleHitbox());
    return super.onLoad();
  }

  void fly() {
    add(MoveByEffect(Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down));
    current = BirdMovement.up;
  }

  @override
  void update(double dt) {
    position.y += Config.birdVelocity * dt;
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void gameOver() {
    gameRef.pauseEngine();
  }
}
