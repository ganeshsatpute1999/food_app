import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/usecases/get_add_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_remove_favorites_usecase.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavorites getFavorites;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

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
      (favorites) => emit(FavoritesLoaded(favorites)),
    );
  }

  Future<void> _onAddFavorite(
      AddFavorite event, Emitter<FavoritesState> emit) async {
    final result = await addFavoriteUseCase(event.recipe);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (_) {
        add(LoadFavorites()); // ✅ Refresh favorites after adding
      },
    );
  }

  Future<void> _onRemoveFavorite(
      RemoveFavorite event, Emitter<FavoritesState> emit) async {
    final result = await removeFavoriteUseCase(event.recipeId);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (_) {
        add(LoadFavorites()); // ✅ Refresh favorites after removing
      },
    );
  }
}
