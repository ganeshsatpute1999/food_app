import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/favorites_recipe_entity.dart';
import 'package:food_app/domain/usecases/get_add_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_remove_favorites_usecase.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavorites getFavorites;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  List<FavoritesRecipeEntity> favoriteRecipes = [];

  FavoritesBloc(
    this.getFavorites,
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
  ) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  Future<void> _onLoadFavorites(
      LoadFavorites event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result = await getFavorites(NoParams());
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (favorites) {
        favoriteRecipes = favorites;
        emit(FavoritesLoaded(List.from(favoriteRecipes)));
      },
    );
  }

  Future<void> _onAddFavorite(
      AddFavorite event, Emitter<FavoritesState> emit) async {
    if (!favoriteRecipes.any((recipe) => recipe.id == event.recipe.id)) {
      favoriteRecipes.add(event.recipe);
      emit(FavoritesLoaded(List.from(favoriteRecipes))); // ✅ Instant UI update

      await addFavoriteUseCase(event.recipe); // ✅ Save to API/DB
      add(LoadFavorites()); // ✅ Refresh list
    }
  }

  Future<void> _onRemoveFavorite(
      RemoveFavorite event, Emitter<FavoritesState> emit) async {
    favoriteRecipes.removeWhere((recipe) => recipe.id == event.recipeId);
    emit(FavoritesLoaded(List.from(favoriteRecipes))); // ✅ Instant UI update

    await removeFavoriteUseCase(event.recipeId); // ✅ Remove from API/DB
    add(LoadFavorites()); // ✅ Refresh list
  }

  bool isFavorite(int recipeId) {
    return favoriteRecipes.any((recipe) => recipe.id == recipeId);
  }
}
