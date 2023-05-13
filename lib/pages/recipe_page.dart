import 'package:flutter/material.dart';
import 'package:recipe_stash/utils/property_box.dart';

class RecipePage extends StatelessWidget {
  final String recipeName;
  const RecipePage({super.key, required this.recipeName});

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
                      child: Text(
                        recipeName,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
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
              height: 250,
              width: 400,
              color: Color.fromARGB(255, 73, 92, 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PropertyBox(property: "Schwierigkeit", icon: "🟢"),
                  PropertyBox(property: "Ernährungsart", icon: "🥦"),
                  PropertyBox(property: "Rezeptart", icon: "🍹"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
