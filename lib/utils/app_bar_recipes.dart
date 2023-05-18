import 'dart:ui';

import 'package:flutter/material.dart';

class MyAppBarRecipe extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarRecipe({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color.fromARGB(255, 41, 37, 37)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        flexibleSpace: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "RecipeStash",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
    );
  }
}
