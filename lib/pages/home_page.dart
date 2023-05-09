import 'package:flutter/material.dart';
import 'package:recipe_stash/utils/recipe_box.dart';

class HomePage extends StatelessWidget {
  final List _dummy = ["Butter Chicken", "Spaghetti Bolognese", "Birria Tacos"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 71, 65, 73),
        title: const Text(
          "RecipeStash",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 70,
                  width: 380,
                  color: const Color.fromARGB(255, 168, 166, 166),
                  child: const Center(
                    child: Text(
                      "Suche nach einem Rezept",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dummy.length,
              itemBuilder: (context, index) {
                return RecipeBox(name: _dummy[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
