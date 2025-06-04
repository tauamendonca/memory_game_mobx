import 'package:dragon_memory/models/game_card_select.dart';
import 'package:dragon_memory/models/game_play.dart';
import 'package:dragon_memory/repositories/score_repository.dart';
import 'package:dragon_memory/settings/game_settings.dart';
import 'package:dragon_memory/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameCardSelect> gameCards = [];

  @observable
  int score = 0;

  @observable
  bool win = false;

  @observable
  bool lose = false;

  late GamePlay _gamePlay;
  List<GameCardSelect> _choice = [];
  List<Function> _choiceCallback = [];
  int _hits = 0;
  int _numMatches = 0;
  int remainingMatches = 0;
  ScoreRepository scoreRepository;

  @computed
  bool get fullPlay => (_choice.length == 2);

  GameControllerBase({required this.scoreRepository}) {
    reaction((_) => win == true, (bool won) {
      scoreRepository.updateScores(gamePlay: _gamePlay, score: score);
    });
  }

  void startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _hits = 0;
    _numMatches = (_gamePlay.level / 2).round();
    remainingMatches = (_gamePlay.level / 2).round();
    win = false;
    lose = false;
    _resetScore();
    _generateCards();
  }

  void _resetScore() {
    _gamePlay.mode == Mode.normal ? score = 0 : score = _gamePlay.level;
    remainingMatches = (_gamePlay.level / 2).round();
  }

  void _generateCards() {
    List<int> cardOptions = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOptions = cardOptions.sublist(0, _numMatches);
    gameCards = [...cardOptions, ...cardOptions]
        .map(
          (option) =>
              GameCardSelect(option: option, matched: false, selected: false),
        )
        .toList();
    gameCards.shuffle();
  }

  Future<void> choose(GameCardSelect gameCardSelect, Function resetCard) async {
    gameCardSelect.selected = true;
    _choice.add(gameCardSelect);
    _choiceCallback.add(resetCard);
    await _matchChoices();
  }

  Future<void> _matchChoices() async {
    if (fullPlay) {
      if (_choice[0].option == _choice[1].option) {
        _choice[0].matched = true;
        _choice[1].matched = true;
        _hits++;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _choice[i].selected = false;
            _choiceCallback[i]();
          }
        });
      }

      _updateScore();
      _checkGameResult();
      _resetChoices();
    }
  }

  void _resetChoices() {
    _choice = [];
    _choiceCallback = [];
  }

  void _updateScore() {
    _gamePlay.mode == Mode.normal ? score++ : score--;
    remainingMatches = _numMatches - _hits;
  }

  void _checkGameResult() async {
    bool allMatched = _hits == _numMatches;

    if (_gamePlay.mode == Mode.normal) {
      await _checkResultModeNormal(allMatched);
    } else {
      await _checkResultModeHard(allMatched);
    }
  }

  Future<void> _checkResultModeNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => win = allMatched);
  }

  Future<void> _checkResultModeHard(bool allMatched) async {
    if (_choicesOver()) {
      await Future.delayed(
        const Duration(milliseconds: 400),
        () => lose = true,
      );
    }
    if (allMatched && score >= 0) {
      await Future.delayed(const Duration(seconds: 1), () => win = allMatched);
    }
  }

  bool _choicesOver() {
    return score < _numMatches - _hits;
  }

  void restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  void nextLevel() {
    int levelIndex = 0;

    if (_gamePlay.level != GameSettings.levels.last) {
      levelIndex = GameSettings.levels.indexOf(_gamePlay.level) + 1;
    }

    _gamePlay.level = GameSettings.levels[levelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
