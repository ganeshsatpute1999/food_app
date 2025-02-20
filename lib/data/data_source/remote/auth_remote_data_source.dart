import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> signUp(String name, String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DatabaseReference database;

  AuthRemoteDataSourceImpl(this.database);

  @override
  Future<AuthModel> login(String email, String password) async {
    final snapshot = await database
        .child('users')
        .orderByChild('email')
        .equalTo(email)
        .get();

    if (!snapshot.exists) {
      throw Exception("User not found");
    }

    final userData =
        (snapshot.value as Map).values.first as Map<String, dynamic>;

    if (userData['password'] != password) {
      throw Exception("Incorrect password");
    }

    return AuthModel.fromJson(userData['uid'], userData);
  }

  @override
  Future<AuthModel> signUp(String name, String email, String password) async {
    final userId = database.child('users').push().key;

    if (userId == null) {
      throw Exception("Failed to generate user ID");
    }

    final authModel =
        AuthModel(id: userId, name: name, email: email, password: password);
    await database.child('users/$userId').set(authModel.toJson());

    return authModel;
  }

  @override
  Future<void> logout() async {}
}
