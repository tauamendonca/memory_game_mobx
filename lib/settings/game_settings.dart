class GameSettings {
  static const levels = [6, 8, 10, 12, 16, 18, 20, 24, 28, 32, 36, 40];

  static const cardOptions = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
  ];

  static int gameBoardAxisCount(int level) {
    if (level < 10) {
      return 2;
    } else if (level == 10 || level == 12 || level == 18) {
      return 3;
    } else {
      return 4;
    }
  }
}
