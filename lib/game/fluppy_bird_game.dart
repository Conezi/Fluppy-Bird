import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:fluppy_bird/components/background.dart';
import 'package:fluppy_bird/components/bird.dart';
import 'package:fluppy_bird/components/ground.dart';
import 'package:fluppy_bird/components/pipe_group.dart';
import 'package:fluppy_bird/game/configuration.dart';

class FluppyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }
  
  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }

}
