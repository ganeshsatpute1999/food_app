import 'package:dio/dio.dart';
import 'package:food_app/core/network/firebase_client.dart';
import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<DataState<List<UserModel>>> getUser();
  Future<DataState<void>> addUser(Map<String, dynamic> userData);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseClient _firebaseClient;

  UserRemoteDataSourceImpl(this._firebaseClient);

  @override
  Future<DataState<List<UserModel>>> getUser() async {
    try {
      final response = await _firebaseClient.dio.get('users.json');

      if (response.data != null && response.data is Map<String, dynamic>) {
        final users = (response.data as Map<String, dynamic>)
            .values
            .map((data) => UserModel.fromJson(data))
            .toList();

        return DataSuccess(users);
      }
      return DataSuccess([]);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> addUser(Map<String, dynamic> userData) async {
    try {
      await _firebaseClient.dio.post('users.json', data: userData);
      return DataSuccess(null);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
