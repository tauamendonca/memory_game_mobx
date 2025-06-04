import 'package:dragon_memory/theme/theme.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset('assets/logo.png', width: 220, height: 125),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
              text: 'Dragon ',
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Memory',
                  style: TextStyle(color: DragonTheme.color),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
