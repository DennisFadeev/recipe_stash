import 'package:flutter/material.dart';

class RecipeBox extends StatelessWidget {
  final String name;

  RecipeBox({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 100,
            color: const Color.fromARGB(255, 71, 65, 73),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
