import 'dart:io';

import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/pages/home_page.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    windowManager.setMinimumSize(const Size(380, 750));
  }
  runApp(
    MultiProvider(
      providers: [Provider<GameController>(create: (_) => GameController())],
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
