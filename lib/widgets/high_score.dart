import 'package:dragon_memory/pages/scores_page.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';

class HighScore extends StatefulWidget {
  const HighScore({super.key});

  @override
  State<HighScore> createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  Future<void> showScores(Mode mode) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ScoresPage(mode: mode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'High Scores',
                  style: TextStyle(color: DragonTheme.color, fontSize: 22),
                ),
              ),
              ListTile(
                title: const Text('Normal Mode'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showScores(Mode.normal),
              ),
              ListTile(
                title: const Text('Hard Mode'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showScores(Mode.hard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
