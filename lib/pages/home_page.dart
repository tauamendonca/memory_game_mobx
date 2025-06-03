import 'package:dragon_memory/pages/levels_page.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:dragon_memory/widgets/high_score.dart';
import 'package:dragon_memory/widgets/logo.dart';
import 'package:dragon_memory/widgets/start_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DragonTheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              const Logo(),
              StartButton(
                title: 'New Game (Normal)',
                color: Colors.white,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        LevelSelectPage(mode: Mode.normal),
                  ),
                ),
              ),
              StartButton(
                title: 'New Game (Hard)',
                color: DragonTheme.color,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        LevelSelectPage(mode: Mode.hard),
                  ),
                ),
              ),
              SizedBox(height: 24),
              HighScore(),
            ],
          ),
        ),
      ),
    );
  }
}
