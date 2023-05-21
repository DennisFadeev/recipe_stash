import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 200),
            color: Colors.black38,
            backgroundColor: const Color.fromARGB(255, 41, 37, 37),
            onTap: (index) => {if (index == 0) widget.onDelete()},
            items: [
              MaterialButton(
                height: 50,
                onPressed: () => widget.onDelete(),
                child: const Icon(
                  Icons.delete,
                  color: Colors.amber,
                ),
              ),
              const Icon(Icons.edit, color: Colors.amber),
              const Icon(Icons.abc, color: Colors.amber)
            ]),
        appBar: const MyAppBarRecipe(),
        backgroundColor: const Color.fromARGB(255, 41, 37, 37),
        body: Column(
          children: [
            const TabBar(
                indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
                tabs: [
                  Tab(icon: Icon(Icons.cookie, color: Colors.amber)),
                  Tab(icon: Icon(Icons.list, color: Colors.amber))
                ]),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 103,
                width: 403,
                color: Colors.amber,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 100,
                      width: 400,
                      color: Colors.black38.withOpacity(0.7),
                      child: Center(
                          child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                widget.recipeName,
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const SizedBox(height: 11),
                              const Text(
                                "einfach, vegan, cocktail",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                IngredientsPage(name: widget.recipeName),
                const Center(
                    child: Text(
                  "2",
                  style: TextStyle(fontSize: 60, color: Colors.white),
                )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
