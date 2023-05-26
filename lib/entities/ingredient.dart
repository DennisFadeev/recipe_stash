import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Ingredient extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? amount;
  @HiveField(2)
  Unit? unit;
}

enum Unit { mg, g, kg, ml, l, stk }

final unitLabels = {
  Unit.mg: "mg",
  Unit.g: "g",
  Unit.kg: "kg",
  Unit.ml: "ml",
  Unit.l: "l",
  Unit.stk: "Stück",
};
