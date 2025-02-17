import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/similar_recipe_entity.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSimilarRecipeUsecase _getSimilarRecipeUsecase;

  HomeBloc(this._getSimilarRecipeUsecase) : super(HomeInitial()) {
    on<GetSimilarRecipeEvent>(_getSimilarRecipeEvent);
  }

  Future<void> _getSimilarRecipeEvent(
      GetSimilarRecipeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final result = await _getSimilarRecipeUsecase.call();

      if (result is Left) {
        final failure = (result as Left).value;
        emit(HomeFailure(failure.message));
      } else if (result is Right) {
        final similarRecipe = (result as Right).value;
        emit(SimilarRecipeLoaded(similarRecipe));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
