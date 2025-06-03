import 'package:dragon_memory/theme/theme.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function action;

  const StartButton({
    super.key,
    required this.title,
    required this.color,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: OutlinedButton(
          style: DragonTheme.outlineButtonStyle(color: color),
          onPressed: () => action(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [Text(title, style: const TextStyle(fontSize: 20))],
          ),
        ),
      ),
    );
  }
}
