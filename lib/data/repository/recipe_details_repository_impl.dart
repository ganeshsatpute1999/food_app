import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_app/core/resources/failures.dart';
import 'package:food_app/data/data_source/remote/recipe_details_remote_data_source.dart';
import 'package:food_app/domain/entities/recipe_details_entity.dart';
import 'package:food_app/domain/repository/recipe_details_repository.dart';
import 'package:dio/dio.dart';

class RecipeDetailsRepositoryImpl implements RecipeDetailsRepository {
  final RecipeDetailsRemoteDataSource remoteDataSource;

  RecipeDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, RecipeDetailsEntity>> getRecipeDetail(int recipeId) async {
    try {
      final model = await remoteDataSource.getRecipeDetail(recipeId);
      return Right(
        RecipeDetailsEntity(
          id: model.id,
          title: model.title,
          image: model.image,
          servings: model.servings,
          readyInMinutes: model.readyInMinutes,
          cookingMinutes: model.cookingMinutes,
          preparationMinutes: model.preparationMinutes,
          pricePerServing: model.pricePerServing,
          vegan: model.vegan,
          vegetarian: model.vegetarian,
          dishTypes: model.dishTypes,
        ),
      );
    } on DioException catch (e) {
      
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on SocketException {
      
      return Left(ConnectionFailure("No Internet Connection"));
    } on DatabaseFailure {
    
      return Left(DatabaseFailure("Database Error"));
    } catch (e) {
    
      return Left(ServerFailure("Unexpected Error: ${e.toString()}"));
    }
  }
}
