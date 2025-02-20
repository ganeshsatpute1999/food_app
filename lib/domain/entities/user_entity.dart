import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;

  const UserEntity({ required this.password, 
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object> get props => [id, name, email, password];
}
