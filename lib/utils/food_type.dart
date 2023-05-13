enum FoodType { starter, main, dessert, snack, cocktail }

class FoodTypeInfo {
  FoodType foodType;
  String? displayName;
  String? emoji;

  FoodTypeInfo(this.foodType) {
    switch (foodType) {
      case FoodType.starter:
        {
          displayName = "Vorspeise";
          emoji = "🥗";
          break;
        }
      case FoodType.main:
        {
          displayName = "Hauptspeise";
          emoji = "🍝";
          break;
        }
      case FoodType.dessert:
        {
          displayName = "Nachtisch";
          emoji = "🍮";
          break;
        }
      case FoodType.snack:
        {
          displayName = "Snack";
          emoji = "🥪";
          break;
        }
      case FoodType.cocktail:
        {
          displayName = "Cocktail";
          emoji = "🍹";
          break;
        }
      default:
        {
          displayName = "Default";
          emoji = "🍽️";
        }
    }
  }
}
