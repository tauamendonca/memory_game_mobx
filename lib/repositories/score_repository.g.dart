// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScoreRepository on ScoreRepositoryBase, Store {
  late final _$scoresNormalAtom = Atom(
    name: 'ScoreRepositoryBase.scoresNormal',
    context: context,
  );

  @override
  Map<dynamic, dynamic> get scoresNormal {
    _$scoresNormalAtom.reportRead();
    return super.scoresNormal;
  }

  @override
  set scoresNormal(Map<dynamic, dynamic> value) {
    _$scoresNormalAtom.reportWrite(value, super.scoresNormal, () {
      super.scoresNormal = value;
    });
  }

  late final _$scoresHardAtom = Atom(
    name: 'ScoreRepositoryBase.scoresHard',
    context: context,
  );

  @override
  Map<dynamic, dynamic> get scoresHard {
    _$scoresHardAtom.reportRead();
    return super.scoresHard;
  }

  @override
  set scoresHard(Map<dynamic, dynamic> value) {
    _$scoresHardAtom.reportWrite(value, super.scoresHard, () {
      super.scoresHard = value;
    });
  }

  late final _$ScoreRepositoryBaseActionController = ActionController(
    name: 'ScoreRepositoryBase',
    context: context,
  );

  @override
  dynamic loadScores() {
    final _$actionInfo = _$ScoreRepositoryBaseActionController.startAction(
      name: 'ScoreRepositoryBase.loadScores',
    );
    try {
      return super.loadScores();
    } finally {
      _$ScoreRepositoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scoresNormal: ${scoresNormal},
scoresHard: ${scoresHard}
    ''';
  }
}
