import 'package:dragon_memory/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:dragon_memory/models/game_play.dart';

part 'score_repository.g.dart';

class ScoreRepository = ScoreRepositoryBase with _$ScoreRepository;

abstract class ScoreRepositoryBase with Store {
  late final Box _scores;
  late final GamePlay gamePlay;

  @observable
  Map scoresNormal = {};

  @observable
  Map scoresHard = {};

  ScoreRepositoryBase() {
    _initRepository();
  }

  Future<void> _initRepository() async {
    await _initDatabase();
    await loadScores();
  }

  Future<void> _initDatabase() async {
    _scores = await Hive.openBox('gameScores');
  }

  @action
  // loadScores may return a String or something else entirely, so Void or
  // String as type annotation is not ideal. I have yet to find out what to put here
  // ignore: strict_top_level_inference
  loadScores() {
    scoresNormal = _scores.get(Mode.normal.toString()) ?? {};
    scoresHard = _scores.get(Mode.hard.toString()) ?? {};
  }

  void updateScores({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.mode.toString();

    if (gamePlay.mode == Mode.normal &&
        (scoresNormal[gamePlay.level] == null ||
            score < scoresNormal[gamePlay.level])) {
      scoresNormal[gamePlay.level] = score;
      _scores.put(key, scoresNormal);
    } else if (gamePlay.mode == Mode.hard &&
        (scoresHard[gamePlay.level] == null ||
            score > scoresHard[gamePlay.level])) {
      scoresHard[gamePlay.level] = score;
      _scores.put(key, scoresHard);
    }
  }
}
