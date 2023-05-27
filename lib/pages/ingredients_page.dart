import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_stash/entities/ingredient.dart';
import 'package:recipe_stash/utils/ingredient_dialog.dart';

import '../utils/ingredient_box.dart';

class IngredientsPage extends StatefulWidget {
  final String name;

  IngredientsPage({super.key, required this.name});

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  final _ingredients = Hive.box("ingredients");
  final units = [Unit.mg, Unit.g, Unit.kg, Unit.ml, Unit.l, Unit.stk];
  var defaultUnit = Unit.g;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ingredient = Ingredient()
      ..name = "Hühnchen"
      ..amount = "2"
      ..unit = Unit.stk;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 37, 37),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.amber),
                    color: const Color.fromARGB(255, 41, 37, 37)),
                height: 450,
                width: 400,
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return IngredientBox(ingredient: ingredient);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 70,
                            color: Colors.black26,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(IngredientDialog(builder: (context) {
                                  return IngredientDialogBox();
                                }));
                              },
                              child: Hero(
                                tag: "Test String",
                                child: Container(
                                  width: 200,
                                  child: Material(
                                    color: Colors.black54,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Hinzufügen",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.amber),
                                        ),
                                        Icon(
                                          Icons.add_rounded,
                                          size: 30,
                                          color: Colors.amber,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                )),
          ),
        ));
  }
}
