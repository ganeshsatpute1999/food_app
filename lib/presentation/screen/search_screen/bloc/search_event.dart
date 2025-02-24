part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipesEvent extends SearchEvent {
  final String query;

  const SearchRecipesEvent( this.query);

  @override
  List<Object> get props => [query];
}
