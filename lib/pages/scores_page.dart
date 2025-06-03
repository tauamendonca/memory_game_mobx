import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';

class ScoresPage extends StatefulWidget {
  final Mode mode;

  const ScoresPage({super.key, required this.mode});

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  final List<String> recs = ['Mode', 'Level 8', 'Level 10', 'Level 12'];

  String getMode() {
    return widget.mode == Mode.normal ? 'Normal' : 'Hard';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('High Scores'))),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 36, bottom: 24),
                    child: Center(
                      child: Text(
                        'Mode: ${getMode()}',
                        style: const TextStyle(
                          fontSize: 28,
                          color: DragonTheme.color,
                        ),
                      ),
                    ),
                  )
                : ListTile(
                    title: Text(recs[index]),
                    trailing: const Text('X moves'),
                    tileColor: Colors.grey[900],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  );
          },
          separatorBuilder: (_, _) => const Divider(color: Colors.transparent),
          itemCount: recs.length,
        ),
      ),
    );
  }
}
