part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();

  @override
  List<Object> get props => [];
}

class RecipeDetailsInitial extends RecipeDetailsState {}

class RecipeDetailLoading extends RecipeDetailsState {}

class RecipeDetailLoaded extends RecipeDetailsState {
  final RecipeDetailsEntity recipe;

  const RecipeDetailLoaded({required this.recipe});

  @override
  List<Object> get props => [recipe];
}

class RecipeDetailError extends RecipeDetailsState {
  final String message;

  const RecipeDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
