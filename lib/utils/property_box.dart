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
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1)
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 22),
                      child: Text(
                        widget.property,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Text(
                        widget.icon,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
