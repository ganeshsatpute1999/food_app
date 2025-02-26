import 'package:food_app/domain/entities/random_recipe_entity.dart';

class RandomRecipeModel extends RandomRecipeEntity {
  const RandomRecipeModel({
    required super.id,
    required super.title,
  });

  factory RandomRecipeModel.fromJson(Map<String, dynamic> json) {
    return RandomRecipeModel(
      title: json['title'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': id,
      'title': title,
    };
  }
}
