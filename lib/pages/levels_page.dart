import 'package:dragon_memory/models/game_play.dart';
import 'package:dragon_memory/settings/game_settings.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:dragon_memory/widgets/level_card.dart';
import 'package:flutter/material.dart';

class LevelSelectPage extends StatelessWidget {
  final Mode mode;

  const LevelSelectPage({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    final levels = GameSettings.levels
        .map(
          (n) => LevelCard(
            gamePlay: GamePlay(mode: mode, level: n),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Level Select')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(24),
              children: levels,
            ),
          ),
        ),
      ),
    );
  }
}
