import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/search_recipe_entity.dart';
import 'package:food_app/domain/usecases/get_search_recipe_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchRecipesUsecase getSearchRecipesUsecase;

  SearchBloc({required this.getSearchRecipesUsecase})
      : super(SearchInitialState()) {
    on<SearchRecipesEvent>((event, emit) async {
      emit(SearchLoadingState());

      final Either<Failure, List<SearchRecipeEntity>> result =
          await getSearchRecipesUsecase(event.query);

      result.fold(
        (failure) => emit(SearchErrorState(message: "Failed to fetch results")),
        (recipes) => emit(SearchLoadedState(recipes: recipes)),
      );
    });
  }
}
