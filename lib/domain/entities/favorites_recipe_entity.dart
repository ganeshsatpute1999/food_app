import 'package:equatable/equatable.dart';

class FavoritesRecipeEntity extends Equatable {
  final int id;
  final String title;
  final String image;

  const FavoritesRecipeEntity({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, image];
}
