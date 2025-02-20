part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();
  
  @override
  List<Object> get props => [];
}

final class RecipeDetailsInitial extends RecipeDetailsState {}

final class RecipeDetailLoading extends RecipeDetailsState {}

final class RecipeDetailLoaded extends RecipeDetailsState {
  final RecipeDetailsEntity recipe;
  const RecipeDetailLoaded({required this.recipe});
}

final class RecipeDetailError extends RecipeDetailsState {
  final String message;
  const RecipeDetailError({required this.message});
}