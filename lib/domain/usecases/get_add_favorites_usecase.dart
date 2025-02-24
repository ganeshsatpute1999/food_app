import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/domain/entities/recipe_entity.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';
import '../../core/usecase/usecase.dart';


class AddFavoriteUseCase extends UseCase<void, RecipeEntity> {
  final RecipeRepository repository;

  AddFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RecipeEntity recipe) {
    return repository.addFavoriteRecipe(recipe);
  }
}
