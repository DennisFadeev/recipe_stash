import 'package:flutter/material.dart';
import 'package:recipe_stash/pages/recipe_page.dart';

class RecipeBox extends StatelessWidget {
  final String name;
  final VoidCallback onDelete;

  RecipeBox({required this.name, required this.onDelete});

  void _navigateToRecipePage(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecipePage(
                recipeName: name,
                onDelete: () => onDelete(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () => {
            _navigateToRecipePage(context, name),
          },
          child: Container(
              height: 100,
              color: const Color.fromARGB(255, 53, 53, 71),
              child: Row(children: [
                Container(
                  width: 250,
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
