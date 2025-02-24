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
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      image: json['image'] ?? '',
      servings: json['servings'] ?? 1,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      cookingMinutes: json['cookingMinutes'] ?? 0,
      preparationMinutes: json['preparationMinutes'] ?? 0,
      pricePerServing: (json['pricePerServing'] as num?)?.toDouble() ?? 0.0,
      vegan: json['vegan'] ?? false,
      vegetarian: json['vegetarian'] ?? false,
      dishTypes: (json['dishTypes'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
