import 'package:flutter/material.dart';

class PropertyBox extends StatefulWidget {
  final String icon;
  final String property;
  const PropertyBox({Key? key, required this.icon, required this.property})
      : super(key: key);

  @override
  State<PropertyBox> createState() => _PropertyBoxState();
}

class _PropertyBoxState extends State<PropertyBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 70,
            width: 325,
            decoration: const BoxDecoration(color: Colors.black38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.property,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.icon,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
