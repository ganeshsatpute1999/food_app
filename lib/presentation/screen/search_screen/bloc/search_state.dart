part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {
  
}

class SearchLoadingState extends SearchState {
  
}

class SearchLoadedState extends SearchState {
  final List<SearchRecipeEntity> recipes;

  const SearchLoadedState({required this.recipes});
@override
  
  List<Object> get props => [];
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState({required this.message});

@override
  List<Object> get props => [message];
}
