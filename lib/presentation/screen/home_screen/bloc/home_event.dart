part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetSimilarRecipeEvent extends HomeEvent {}

final class GetRandomRecipesEvent extends HomeEvent {
  const GetRandomRecipesEvent({
    required this.includeTags,
    required this.excludeTags,
    required this.number,
  });

  final List<String> includeTags;
  final List<String> excludeTags;
  final int number;

  @override
  List<Object> get props => [includeTags, excludeTags, number];
}

final class ChangeTabEvent extends HomeEvent {
  final int index;

  const ChangeTabEvent(this.index);

  @override
  List<Object> get props => [index];
}
