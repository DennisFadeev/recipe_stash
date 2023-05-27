import 'dart:ui';

import 'package:flutter/material.dart';

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
  const IngredientDialogBox({super.key});

  @override
  State<IngredientDialogBox> createState() => _IngredientDialogBoxState();
}

class _IngredientDialogBoxState extends State<IngredientDialogBox> {
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
                  height: 300,
                  width: 500,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Zutat hinzufügen",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
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
