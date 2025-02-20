import 'package:equatable/equatable.dart';

class RecipeDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final int servings;
  final int readyInMinutes;
  final int cookingMinutes;
  final int preparationMinutes;
  final double pricePerServing;
  final bool vegan;
  final bool vegetarian;
  final List<String> dishTypes;

  const RecipeDetailsEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.servings,
    required this.readyInMinutes,
    required this.cookingMinutes,
    required this.preparationMinutes,
    required this.pricePerServing,
    required this.vegan,
    required this.vegetarian,
    required this.dishTypes,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        image,
        servings,
        readyInMinutes,
        cookingMinutes,
        preparationMinutes,
        pricePerServing,
        vegan,
        vegetarian,
        dishTypes
      ];
}
