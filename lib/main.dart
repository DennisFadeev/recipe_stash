import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_stash/pages/home_page.dart';
import 'package:recipe_stash/utils/adapters/ingredient_adapter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientAdapter());
  await Hive.openBox("recipeNames");
  await Hive.openBox("ingredients");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
