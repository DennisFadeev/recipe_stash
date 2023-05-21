import 'package:flutter/material.dart';

import '../entities/ingredient.dart';

class IngredientBox extends StatelessWidget {
  final Ingredient? ingredient;
  const IngredientBox({super.key, this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.1)),
        height: 100,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              ingredient?.name ?? "",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("${ingredient?.amount ?? ""} ${ingredient?.unit ?? ""}",
                style: const TextStyle(fontSize: 18, color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
