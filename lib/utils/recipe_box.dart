import 'package:flutter/material.dart';
import 'package:recipe_stash/pages/recipe_page.dart';

class RecipeBox extends StatelessWidget {
  final String name;

  RecipeBox({required this.name});

  void _navigateToRecipePage(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecipePage(recipeName: name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () => _navigateToRecipePage(context, name),
          child: Container(
              height: 100,
              color: const Color.fromARGB(255, 53, 53, 71),
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
