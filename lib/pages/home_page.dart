import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:recipe_stash/utils/recipe_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _StatefulHomePageState();
}

class _StatefulHomePageState extends State<HomePage> {
  final _names = Hive.box("recipeNames");
  List<dynamic>? currentRecipes;

  void writeData(String newName) {
    var list = readData();
    list.add(newName);
    _names.put("names", list);
  }

  List<dynamic> readData() {
    return _names.get("names");
  }

  void deleteRecipe(String name) async {
    List<dynamic> list = _names.get("names");
    list.removeWhere((element) => element == name);
    _names.put("names", list);
  }

  @override
  initState() {
    currentRecipes = ["Butter Chicken", "Spaghetti Bolognese", "Pizza"];
    super.initState();
  }

  void _runFilter(String keyword) {
    List<dynamic> results = [];
    if (keyword.isEmpty) {
      results = readData();
    } else {
      results = readData()
          .where((recipe) =>
              recipe.toString().toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      currentRecipes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              selectedIndex: -1,
              activeColor: Colors.white,
              color: Colors.white,
              backgroundColor: Colors.black,
              tabBackgroundColor: Color.fromARGB(255, 53, 53, 71),
              gap: 8,
              tabs: [
                GButton(icon: Icons.add, text: "Hinzufügen"),
                GButton(icon: Icons.casino, text: "Zufallsgenerator")
              ]),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 37, 37),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "RecipeStash",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: GestureDetector(
                  child: Container(
                    height: 70,
                    width: 380,
                    color: const Color.fromARGB(255, 168, 166, 166),
                    child: Row(children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Suche nach einem Rezept...',
                          ),
                        ),
                      )
                    ]),
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentRecipes?.length,
              itemBuilder: (context, index) {
                return RecipeBox(name: currentRecipes?[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
