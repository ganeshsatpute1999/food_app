import 'package:food_app/domain/entities/user_entity.dart';

class AuthModel extends UserEntity {
  final String id;
  final String name;
  final String email;
  final String password;

 const AuthModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  }) : super(id: '', name: '', email: '' ,password:'');

  @override
  // TODO: implement props
  List<Object> get props => [id,name, email,password];

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      password: password,
    );
  }

  factory AuthModel.fromJson(String uid, Map<String, dynamic> json) {
    return AuthModel(
      id: uid,
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
