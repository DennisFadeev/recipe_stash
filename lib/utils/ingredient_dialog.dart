import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../entities/ingredient.dart';

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class IngredientDialog<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  IngredientDialog({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

class IngredientDialogBox extends StatefulWidget {
  final String name;
  const IngredientDialogBox({super.key, required this.name});

  @override
  State<IngredientDialogBox> createState() => _IngredientDialogBoxState();
}

class _IngredientDialogBoxState extends State<IngredientDialogBox> {
  final _ingredients = Hive.box("ingredients");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final unitList = [Unit.mg, Unit.g, Unit.kg, Unit.ml, Unit.l, Unit.stk];
  var defaultUnit = Unit.g;

  void addIngredient(String name, Ingredient ingredient) {
    var list = _ingredients.get(name);
    list ??= [];
    list.add(ingredient);
    _ingredients.put(name, list);
    /* list.add(ingredient);
    _ingredients.put(name, list); */
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "Test String",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black87,
                  height: 400,
                  width: 500,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Zutat hinzufügen",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: "Name der Zutat",
                              focusColor: Colors.amber,
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: _amountController,
                            decoration: const InputDecoration(
                              labelText: "Menge",
                              focusColor: Colors.amber,
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 100,
                            child: DropdownButton(
                              dropdownColor: Color.fromARGB(255, 31, 28, 28),
                              value: defaultUnit,
                              hint: const Text(
                                'Einheit',
                                style: TextStyle(color: Colors.white),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  defaultUnit = newValue!;
                                });
                              },
                              items: unitList.map((Unit item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    unitLabels[item]!,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => {
                          addIngredient(
                              widget.name,
                              Ingredient()
                                ..name = _nameController.text
                                ..amount = _amountController.text
                                ..unit = defaultUnit),
                          Navigator.pop(context)
                        },
                        child: Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 60.0,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
