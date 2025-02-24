import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, name, email, avatarUrl];
}
