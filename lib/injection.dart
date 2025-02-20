import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/data_source/remote/auth_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/recipe_details_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/search_recipe_remote_datasource.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/repository/auth_repository_impl.dart';
import 'package:food_app/data/repository/recipe_details_repository_impl.dart';
import 'package:food_app/data/repository/search_recipe_repository_impl.dart';
import 'package:food_app/data/repository/similar_recipe_repository_impl.dart';
import 'package:food_app/domain/repository/auth_repository.dart';
import 'package:food_app/domain/repository/recipe_details_repository.dart';
import 'package:food_app/domain/repository/search_recipe_repository.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';
import 'package:food_app/domain/usecases/get_login_usecase.dart';
import 'package:food_app/domain/usecases/get_recipe_details_usecase.dart';
import 'package:food_app/domain/usecases/get_search_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_signup_usecase.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_logout_usecase.dart'; 
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/loginscreen/bloc/auth_bloc.dart';
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
   locator.registerLazySingleton<AuthRemoteDataSource>(
     () => AuthRemoteDataSourceImpl(locator())); 

  //  Repository Implementations
  locator.registerLazySingleton<SimilarRecipeRepository>(
      () => SimilarRecipeRepositoryImpl(locator()));
  locator.registerLazySingleton<RecipeDetailsRepository>(
      () => RecipeDetailsRepositoryImpl(locator()));
  locator.registerLazySingleton<SearchRecipeRepository>(
      () => SearchRecipeRepositoryImpl(locator()));
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));

  // ✅ Use Cases
  locator.registerLazySingleton(() => GetSimilarRecipeUsecase(locator()));
  locator.registerLazySingleton(() => GetRecipeDetailsUsecase(locator()));
  locator.registerLazySingleton(() => GetSearchRecipesUsecase(locator()));
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => SignUpUseCase(locator()));
  locator.registerLazySingleton(() => LogoutUseCase(locator()));

  // ✅ BLoC Registration
  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(
      () => RecipeDetailsBloc(getRecipeDetailsUsecase: locator()));
  locator.registerFactory(() => SearchBloc(getSearchRecipesUsecase: locator()));
  locator.registerFactory(() => AuthBloc(locator(), locator(), locator()));
}
