// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on GameControllerBase, Store {
  Computed<bool>? _$fullPlayComputed;

  @override
  bool get fullPlay => (_$fullPlayComputed ??= Computed<bool>(
    () => super.fullPlay,
    name: 'GameControllerBase.fullPlay',
  )).value;

  late final _$gameCardsAtom = Atom(
    name: 'GameControllerBase.gameCards',
    context: context,
  );

  @override
  List<GameCardSelect> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameCardSelect> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$scoreAtom = Atom(
    name: 'GameControllerBase.score',
    context: context,
  );

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$winAtom = Atom(name: 'GameControllerBase.win', context: context);

  @override
  bool get win {
    _$winAtom.reportRead();
    return super.win;
  }

  @override
  set win(bool value) {
    _$winAtom.reportWrite(value, super.win, () {
      super.win = value;
    });
  }

  late final _$loseAtom = Atom(
    name: 'GameControllerBase.lose',
    context: context,
  );

  @override
  bool get lose {
    _$loseAtom.reportRead();
    return super.lose;
  }

  @override
  set lose(bool value) {
    _$loseAtom.reportWrite(value, super.lose, () {
      super.lose = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
win: ${win},
lose: ${lose},
fullPlay: ${fullPlay}
    ''';
  }
}
