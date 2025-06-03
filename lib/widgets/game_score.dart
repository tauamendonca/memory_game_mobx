import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GameScore extends StatelessWidget {
  final Mode mode;

  const GameScore({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              mode == Mode.hard ? Icons.castle_outlined : Icons.house_outlined,
            ),
            const SizedBox(width: 10),
            Observer(
              builder: (_) => mode == Mode.normal
                  ? Text(
                      'Moves: ${controller.score}',
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      'Matches left: ${controller.remainingMatches} - Moves left: ${controller.score}',
                      style: TextStyle(fontSize: 20),
                    ),
            ),
          ],
        ),
        Image.asset('assets/logo.png', width: 120),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Exit', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
