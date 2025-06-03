import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/models/game_play.dart';
import 'package:dragon_memory/pages/game_page.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelCard extends StatelessWidget {
  final GamePlay gamePlay;

  const LevelCard({super.key, required this.gamePlay});

  void startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.mode == Mode.normal
                ? Colors.white
                : DragonTheme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            gamePlay.level.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
