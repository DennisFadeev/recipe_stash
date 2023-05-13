enum Difficulty { easy, medium, hard }

class DifficultyInfo {
  String getDifficultyEmoji(Difficulty type) {
    switch (type) {
      case Difficulty.easy:
        return '🟢';
      case Difficulty.medium:
        return '🟡';
      case Difficulty.hard:
        return '🔴';
    }
  }
}
