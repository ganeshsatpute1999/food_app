import 'package:flutter/material.dart';
import 'package:food_app/domain/entities/recipe_details_entity.dart';

class RecipeInfo extends StatelessWidget {
  final RecipeDetailsEntity recipe;

  const RecipeInfo({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipe.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ready in ${recipe.readyInMinutes} min",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("Cooking: ${recipe.cookingMinutes} min",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 8),
        Text("Preparation: ${recipe.preparationMinutes} min",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Servings: ${recipe.servings}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("Price: \$${recipe.pricePerServing.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
