enum NutritionType { omnivore, vegetarian, vegan }

class NutritionTypeInfo {
  NutritionType type;
  String? emoji;
  NutritionTypeInfo({required this.type}) {
    switch (type) {
      case NutritionType.omnivore:
        {
          emoji = "🍖";
          break;
        }
      case NutritionType.vegetarian:
        {
          emoji = "🥚";
          break;
        }
      case NutritionType.vegan:
        {
          emoji = "🥦";
          break;
        }
    }
  }
}
