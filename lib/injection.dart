import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/firebase_client.dart';
import 'package:food_app/data/data_source/remote/random_recipe_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/data_source/remote/user_remote_data_source.dart';
import 'package:food_app/data/repository/random_recipe_repository_impl.dart';
import 'package:food_app/data/repository/similar_recipe_repository_impl.dart';
import 'package:food_app/data/repository/user_repository_impl.dart';
import 'package:food_app/domain/repository/random_recipe_repository.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';
import 'package:food_app/domain/repository/user_repository.dart';
import 'package:food_app/domain/usecases/add_user_usecase.dart';
import 'package:food_app/domain/usecases/get_random_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';
import 'package:food_app/domain/usecases/get_user_usecase.dart';
import 'package:food_app/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:food_app/presentation/screen/login_screen/bloc/login_bloc.dart';
import 'package:food_app/presentation/screen/sign_up_screen/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.asNewInstance();

Future<void> init() async {
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

  locator.registerFactory(() => HomeBloc(locator(), locator()));

  locator.registerLazySingleton(() => GetSimilarRecipeUsecase(locator()));

  locator.registerLazySingleton<SimilarRecipeRepository>(
      () => SimilarRecipeRepositoryImpl(locator()));

  locator.registerLazySingleton<SimilarRecipeRemoteDataSource>(
      () => SimilarRecipeRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton(() => GetRandomRecipeUsecase(locator()));

  // Repository
  locator.registerLazySingleton<RandomRecipeRepository>(
      () => RandomRecipeRepositoryImpl(remoteDataSource: locator()));

  // DataSource
  locator.registerLazySingleton<RandomRecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton(() => DioClient());
}
