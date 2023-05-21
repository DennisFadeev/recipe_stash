import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Ingredient extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? amount;
  @HiveField(2)
  Unit? unit;
}

enum Unit { mg, g, kg, ml, l }
