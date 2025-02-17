part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final String message;

  const HomeSuccess(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}

final class SimilarRecipeLoaded extends HomeState {
  final List<SimilarRecipeEntity> similarRecipe;

  const SimilarRecipeLoaded(
    this.similarRecipe,
  );
}

final class HomeFailure extends HomeState {
  final String error;

  const HomeFailure(this.error);
}
