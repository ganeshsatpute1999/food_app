import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/firebase_client.dart';
import 'package:food_app/data/data_source/remote/recipe_details_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/search_recipe_remote_datasource.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/user_remote_data_source.dart';
import 'package:food_app/data/repository/recipe_details_repository_impl.dart';
import 'package:food_app/data/repository/search_recipe_repository_impl.dart';
import 'package:food_app/data/repository/similar_recipe_repository_impl.dart';
import 'package:food_app/data/repository/user_repository_impl.dart';
import 'package:food_app/domain/repository/recipe_details_repository.dart';
import 'package:food_app/domain/repository/search_recipe_repository.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';
import 'package:food_app/domain/repository/user_repository.dart';
import 'package:food_app/domain/usecases/add_user_usecase.dart';

import 'package:food_app/domain/usecases/get_recipe_details_usecase.dart';
import 'package:food_app/domain/usecases/get_search_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_user_usecase.dart';
import 'package:food_app/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/login_screen/bloc/login_bloc.dart';
import 'package:food_app/presentation/screen/recipe_details_screen/bloc/recipe_details_bloc.dart';
import 'package:food_app/presentation/screen/search_screen/bloc/search_bloc.dart';
import 'package:food_app/presentation/screen/sign_up_screen/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() => DioClient());

  locator.registerFactory(() => LoginBloc(locator()));

  locator.registerFactory(() => SignupBloc(locator()));

  locator.registerLazySingleton(() => GetUserUsecase(locator()));

  locator.registerLazySingleton(() => AddUserUsecase(locator()));

  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(locator()),
  );

  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton(() => FirebaseClient());

  locator.registerFactory(() => HomeBloc(locator()));

  locator.registerLazySingleton(() => GetSimilarRecipeUsecase(locator()));

  locator.registerLazySingleton<SimilarRecipeRepository>(
    () => SimilarRecipeRepositoryImpl(locator()),
  );

  //  Remote Data Sources
  locator.registerLazySingleton<SimilarRecipeRemoteDataSource>(
      () => SimilarRecipeRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<RecipeDetailsRemoteDataSource>(
      () => RecipeDetailsRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<SearchRecipeRemoteDataSource>(
      () => SearchRecipeRemoteDataSourceImpl(locator()));

  //  Repository Implementations

  locator.registerLazySingleton<RecipeDetailsRepository>(
      () => RecipeDetailsRepositoryImpl(locator()));
  locator.registerLazySingleton<SearchRecipeRepository>(
      () => SearchRecipeRepositoryImpl(locator()));

  //  Use Cases

  locator.registerLazySingleton(() => GetRecipeDetailsUsecase(locator()));
  locator.registerLazySingleton(() => GetSearchRecipesUsecase(locator()));

  //  BLoC Registration

  locator.registerFactory(() => RecipeDetailsBloc(
      getRecipeDetailsUsecase: locator<GetRecipeDetailsUsecase>()));

  locator.registerFactory(() =>
      SearchBloc(getSearchRecipesUsecase: locator<GetSearchRecipesUsecase>()));
}
