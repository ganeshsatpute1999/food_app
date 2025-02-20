import 'package:flutter/material.dart';

class DishTypes extends StatelessWidget {
  final List<String> dishTypes;

  const DishTypes({super.key, required this.dishTypes});

  @override
  Widget build(BuildContext context) {
    return dishTypes.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Dish Types:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: dishTypes.map((type) {
                  return Chip(
                    label: Text(type, style: const TextStyle(color: Colors.white)),
                    backgroundColor: Colors.green,
                  );
                }).toList(),
              ),
            ],
          )
        : const SizedBox();
  }
}
