import 'dart:io';

import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/pages/home_page.dart';
import 'package:dragon_memory/repositories/score_repository.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    windowManager.setMinimumSize(const Size(380, 750));
  }
  runApp(
    MultiProvider(
      providers: [
        Provider<ScoreRepository>(create: (_) => ScoreRepository()),
        ProxyProvider<ScoreRepository, GameController>(
          update: (_, repo, _) => GameController(scoreRepository: repo),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dragon Quest Memory',
      theme: DragonTheme.theme,
      home: const HomePage(),
    );
  }
}
