import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/data_source/remote/favorites_remote_datasource.dart';
import 'package:food_app/data/data_source/remote/recipe_details_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/search_recipe_remote_datasource.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/repository/favorites_repository_impl.dart';
import 'package:food_app/data/repository/recipe_details_repository_impl.dart';
import 'package:food_app/data/repository/search_recipe_repository_impl.dart';
import 'package:food_app/data/repository/similar_recipe_repository_impl.dart';
import 'package:food_app/domain/repository/recipe_details_repository.dart';
import 'package:food_app/domain/repository/recipe_repository.dart';
import 'package:food_app/domain/repository/search_recipe_repository.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';
import 'package:food_app/domain/usecases/get_add_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_recipe_details_usecase.dart';
import 'package:food_app/domain/usecases/get_remove_favorites_usecase.dart';
import 'package:food_app/domain/usecases/get_search_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';
import 'package:food_app/presentation/screen/favoritesscreen/bloc/favorites_bloc.dart';
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/recipedetailsscreen/bloc/recipe_details_bloc.dart';
import 'package:food_app/presentation/screen/search_screen/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => DioClient());

  locator.registerLazySingleton(() => FirebaseDatabase.instance.ref());

  //  Remote Data Sources
  locator.registerLazySingleton<SimilarRecipeRemoteDataSource>(
      () => SimilarRecipeRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<RecipeDetailsRemoteDataSource>(
      () => RecipeDetailsRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<SearchRecipeRemoteDataSource>(
      () => SearchRecipeRemoteDataSourceImpl(locator()));

  //  Repository Implementations
  locator.registerLazySingleton<SimilarRecipeRepository>(
      () => SimilarRecipeRepositoryImpl(locator()));
  locator.registerLazySingleton<RecipeDetailsRepository>(
      () => RecipeDetailsRepositoryImpl(locator()));
  locator.registerLazySingleton<SearchRecipeRepository>(
      () => SearchRecipeRepositoryImpl(locator()));

  //  Use Cases
  locator.registerLazySingleton(() => GetSimilarRecipeUsecase(locator()));
  locator.registerLazySingleton(() => GetRecipeDetailsUsecase(locator()));
  locator.registerLazySingleton(() => GetSearchRecipesUsecase(locator()));

  //  BLoC Registration
  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(() => RecipeDetailsBloc(
      getRecipeDetailsUsecase: locator<GetRecipeDetailsUsecase>()));

  locator.registerFactory(() =>
      SearchBloc(getSearchRecipesUsecase: locator<GetSearchRecipesUsecase>()));

  locator.registerLazySingleton<FavoritesRecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(locator<Dio>()));

  // 🔹 Register Repositories
  locator.registerLazySingleton<FavoritesRecipeRepository>(
      () => FavoritesRepositoryImpl(locator<FavoritesRecipeRemoteDataSource>()));

  // 🔹 Register Use Cases
  locator
      .registerLazySingleton(() => GetFavorites(locator<FavoritesRecipeRepository>()));
  locator.registerLazySingleton(
      () => AddFavoriteUseCase(locator<FavoritesRecipeRepository>())); // ✅ Correct Order
  locator.registerLazySingleton(
      () => RemoveFavoriteUseCase(locator<FavoritesRecipeRepository>()));

  // 🔹 Register BLoC
  locator.registerFactory(() => FavoritesBloc(
        locator<GetFavorites>(),
        locator<AddFavoriteUseCase>(), // ✅ Corrected Order
        locator<RemoveFavoriteUseCase>(),
      ));
}
