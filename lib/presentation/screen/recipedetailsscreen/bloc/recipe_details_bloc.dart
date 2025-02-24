import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/recipe_details_entity.dart';
import 'package:food_app/domain/usecases/get_recipe_details_usecase.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetRecipeDetailsUsecase getRecipeDetailsUsecase;

  RecipeDetailsBloc({required this.getRecipeDetailsUsecase})
      : super(RecipeDetailsInitial()) {
    on<LoadRecipeDetailEvent>((event, emit) async {
      emit(RecipeDetailLoading());
      final result = await getRecipeDetailsUsecase(event.recipeId);

      result.fold(
        (failure) =>
            emit(RecipeDetailError(message: 'Failed to load recipe details')),
        (recipe) => emit(RecipeDetailLoaded(recipe: recipe)),
      );
    });
  }
}
