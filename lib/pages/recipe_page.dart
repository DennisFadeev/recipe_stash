import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_stash/utils/property_box.dart';
import 'package:hive/hive.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "RecipeStash",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 53, 53, 71),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.black38,
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
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              color: Colors.blueGrey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 250,
                  width: 400,
                  color: const Color.fromARGB(255, 53, 53, 71),
                  child: const Center(
                      child: Text(
                    "Zutaten",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                ),
              ),
            ),
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
    );
  }
}
