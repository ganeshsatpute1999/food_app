import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/data/data_source/remote/similar_recipe_remote_data_source.dart';
import 'package:food_app/data/repository/similar_recipe_repository_impl.dart';
import 'package:food_app/domain/repository/similar_recipe_repository.dart';
import 'package:food_app/domain/usecases/get_similar_recipe_usecase.dart';
import 'package:food_app/presentation/screen/homescreen/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.asNewInstance();

Future<void> init() async {
  locator.registerFactory(() => HomeBloc(locator()));

  locator.registerLazySingleton(() => GetSimilarRecipeUsecase(locator()));

  locator.registerLazySingleton<SimilarRecipeRepository>(
      () => SimilarRecipeRepositoryImpl(locator()));

  locator.registerLazySingleton<SimilarRecipeRemoteDataSource>(
      () => SimilarRecipeRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton(() => DioClient());
}
