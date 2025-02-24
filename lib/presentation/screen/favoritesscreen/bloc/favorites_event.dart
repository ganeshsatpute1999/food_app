import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class LoadFavorites extends FavoritesEvent {}

final class AddFavorite extends FavoritesEvent {
  final FavoritesRecipeEntity recipe;

  const AddFavorite(this.recipe);

  @override
  List<Object?> get props => [recipe];
}

final class RemoveFavorite extends FavoritesEvent {
  final int recipeId;

  const RemoveFavorite(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}
