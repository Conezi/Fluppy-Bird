import 'package:flame/game.dart';
import 'package:fluppy_bird/game/fluppy_bird_game.dart';
import 'package:flutter/material.dart';

void main() {
  final game= FluppyBirdGame();
  runApp(GameWidget(game: game));
}
