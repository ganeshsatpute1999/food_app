import 'package:food_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'No Record found',
      email: json['email'] ?? 'No Record found',
      password: json['password'] ?? 'No Record found',
    );
  }
}
