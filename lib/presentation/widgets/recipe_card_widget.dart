// import 'package:flutter/material.dart';
// import 'package:food_app/data/models/recipe_details_model.dart';

// class RecipeCardWidget extends StatelessWidget {
//   final RecipeDetailsModel recipe;
//   const RecipeCardWidget({super.key, required this.recipe});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       child: ListTile(
//         leading: Image.network(recipe.image,
//             width: 50, height: 50, fit: BoxFit.cover),
//         title: Text(recipe.title),
//         subtitle: Text("Ready in ${recipe.readyInMinutes} min"),
//         trailing: const Icon(Icons.arrow_forward_ios),
//       ),
//     );
//   }
// }
