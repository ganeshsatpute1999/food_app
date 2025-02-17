import 'package:food_app/domain/entities/similar_recipe_entity.dart';

class SimilarRecipeModel extends SimilarRecipeEntity {
  const SimilarRecipeModel({
    required super.id,
    required super.title,
    required super.imageType,
    required super.readyInMinutes,
    required super.servings,
    required super.sourceUrl,
  });

  factory SimilarRecipeModel.fromJson(Map<String, dynamic> json) {
    return SimilarRecipeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Record found',
      imageType: json['imageType'] ?? 'No Record found',
      readyInMinutes: json['readyInMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      sourceUrl: json['sourceUrl'] ?? 'No Record found',
    );
  }
}
