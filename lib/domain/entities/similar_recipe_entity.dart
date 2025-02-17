import 'package:equatable/equatable.dart';

class SimilarRecipeEntity extends Equatable {
  final int id;
  final String title;
  final String imageType;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;

  const SimilarRecipeEntity({
    required this.id,
    required this.title,
    required this.imageType,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageType,
        readyInMinutes,
        servings,
        sourceUrl,
      ];
}
