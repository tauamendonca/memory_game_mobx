import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/models/game_card_select.dart';
import 'package:dragon_memory/models/game_play.dart';
import 'package:dragon_memory/settings/game_settings.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:dragon_memory/widgets/game_feedback.dart';
import 'package:dragon_memory/widgets/game_score.dart';
import 'package:dragon_memory/widgets/play_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({super.key, required this.gamePlay});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScore(mode: gamePlay.mode),
      ),
      body: Observer(
        builder: (_) {
          if (controller.win) {
            return const GameFeedback(result: Result.victory);
          } else if (controller.lose) {
            return const GameFeedback(result: Result.defeat);
          } else {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: GameSettings.gameBoardAxisCount(
                    gamePlay.level,
                  ),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  padding: const EdgeInsets.all(24),
                  children: controller.gameCards
                      .map(
                        (GameCardSelect go) =>
                            PlayCard(mode: gamePlay.mode, gameCardSelect: go),
                      )
                      .toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
