part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsEvent extends Equatable {
  const RecipeDetailsEvent();

  @override
  List<Object> get props => [];
}
class LoadRecipeDetailEvent extends RecipeDetailsEvent {
  final int recipeId;

 const LoadRecipeDetailEvent({required this.recipeId});

  @override
  List<Object> get props => [recipeId];
}