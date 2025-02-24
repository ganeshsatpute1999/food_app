import 'package:food_app/domain/entities/favorites_recipe_entity.dart';


class FavoritesRecipeModel extends FavoritesRecipeEntity {
  const FavoritesRecipeModel({
    required super.id,
    required super.title,
    required super.image,
  });

  factory FavoritesRecipeModel.fromJson(Map<String, dynamic> json) {
    return FavoritesRecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
