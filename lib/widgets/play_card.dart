import 'dart:math';
import 'package:dragon_memory/controllers/game_controller.dart';
import 'package:dragon_memory/models/game_card_select.dart';
import 'package:dragon_memory/theme/theme.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayCard extends StatefulWidget {
  const PlayCard({super.key, required this.mode, required this.gameCardSelect});
  final Mode mode;
  final GameCardSelect gameCardSelect;

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angle = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angle);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: widget.mode == Mode.normal
                      ? DragonTheme.color
                      : Colors.white,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angle),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void flipCard() {
    final game = context.read<GameController>();

    if (!animation.isAnimating &&
        !widget.gameCardSelect.matched &&
        !widget.gameCardSelect.selected &&
        !game.fullPlay) {
      animation.forward();
      game.choose(widget.gameCardSelect, resetCard);
    }
  }

  void resetCard() {
    animation.reverse();
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage(
        'assets/${widget.gameCardSelect.option.toString()}.png',
      );
    } else {
      return widget.mode == Mode.normal
          ? const AssetImage('assets/normal.png')
          : const AssetImage('assets/hard.png');
    }
  }
}
