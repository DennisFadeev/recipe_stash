import 'package:hive/hive.dart';

import '../../entities/ingredient.dart';

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 0; // Unique identifier for the adapter

  @override
  Ingredient read(BinaryReader reader) {
    return Ingredient()
      ..name = reader.read()
      ..amount = reader.read()
      ..unit = _unitFromIndex(reader.read());
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer.write(obj.name);
    writer.write(obj.amount);
    writer.write(_unitToIndex(obj.unit));
  }

  // Helper method to convert enum to index
  int _unitToIndex(Unit? unit) {
    return unit != null ? unit.index : -1;
  }

  // Helper method to convert index to enum
  Unit? _unitFromIndex(int index) {
    if (index >= 0 && index < Unit.values.length) {
      return Unit.values[index];
    }
    return null;
  }
}
