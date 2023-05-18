import 'package:flutter/material.dart';
import 'package:recipe_stash/pages/ingredients_page.dart';
import 'package:hive/hive.dart';
import 'package:recipe_stash/utils/app_bar_recipes.dart';

class RecipePage extends StatefulWidget {
  final String recipeName;
  final VoidCallback onDelete;
  RecipePage({super.key, required this.recipeName, required this.onDelete});
  final _names = Hive.box("recipeNames");

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MyAppBarRecipe(),
        backgroundColor: const Color.fromARGB(255, 41, 37, 37),
        body: Column(
          children: [
            const TabBar(
                indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
                tabs: [
                  Tab(icon: Icon(Icons.cookie, color: Colors.white)),
                  Tab(icon: Icon(Icons.list, color: Colors.white))
                ]),
            const SizedBox(
              height: 20,
            ),
            SizedBox(height: 300),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black38),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () => widget.onDelete(),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
