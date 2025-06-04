import 'package:dragon_memory/repositories/score_repository.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ScoresPage extends StatefulWidget {
  final Mode mode;

  const ScoresPage({super.key, required this.mode});

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  String getMode() {
    return widget.mode == Mode.normal ? 'Normal' : 'Hard';
  }

  List<Widget> getScoreList(Map scores) {
    final List<Widget> widgets = [];

    scores.forEach((level, score) {
      widgets.add(
        ListTile(
          title: Text('Level: $level'),
          trailing: Text(score.toString()),
          tileColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );

      widgets.add(const Divider(color: Colors.transparent));
    });

    if (widgets.isEmpty) {
      widgets.add(Center(child: Text('No scores were recorded yet')));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ScoreRepository>(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('High Scores')),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Observer(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Center(
                  child: Text(
                    '${getMode()} Mode',
                    style: const TextStyle(
                      fontSize: 28,
                      color: DragonTheme.color,
                    ),
                  ),
                ),
              ),
              ...getScoreList(
                widget.mode == Mode.normal
                    ? repository.scoresNormal
                    : repository.scoresHard,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
