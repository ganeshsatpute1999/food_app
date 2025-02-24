import 'package:food_app/domain/entities/search_recipe_entity.dart';

class SearchRecipeModel extends SearchRecipeEntity {
  const SearchRecipeModel(
      {required super.id, required super.title, required super.image});

  factory SearchRecipeModel.fromJson(Map<String, dynamic> json) {
    return SearchRecipeModel(
      id: json["id"],
      title: json["title"],
      image: json["image"] != null
          ? "https://spoonacular.com/recipeImages/${json["id"]}-312x231.jpg"
          : "https://yourapp.com/assets/images/placeholder.png", // Fallback
    );
  }
}
