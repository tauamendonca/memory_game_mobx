import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:dragon_memory/widgets/start_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameFeedback extends StatelessWidget {
  final Result result;

  const GameFeedback({super.key, required this.result});

  String getResult() {
    return result == Result.victory ? 'victory' : 'defeat';
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<GameController>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${getResult().toUpperCase()}!',
              style: const TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              child: Image.asset('assets/${getResult()}.png', height: 300),
            ),
            result == Result.defeat
                ? StartButton(
                    title: 'Try Again',
                    color: Colors.white,
                    action: () => controller.restartGame(),
                  )
                : StartButton(
                    title: 'Next Level',
                    color: Colors.white,
                    action: () => controller.nextLevel(),
                  ),
          ],
        ),
      ),
    );
  }
}
