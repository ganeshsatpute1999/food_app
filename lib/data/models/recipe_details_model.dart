import 'package:food_app/domain/entities/recipe_details_entity.dart';

class RecipeDetailsModel extends RecipeDetailsEntity {
  const RecipeDetailsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.servings,
    required super.readyInMinutes,
    required super.cookingMinutes,
    required super.preparationMinutes,
    required super.pricePerServing,
    required super.vegan,
    required super.vegetarian,
    required super.dishTypes,
  });

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailsModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      servings: json['servings'],
      readyInMinutes: json['readyInMinutes'],
      cookingMinutes: json['cookingMinutes'],
      preparationMinutes: json['preparationMinutes'],
      pricePerServing: json['pricePerServing'],
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
      dishTypes: List<String>.from(json['dishTypes']),
    );
  }
}
