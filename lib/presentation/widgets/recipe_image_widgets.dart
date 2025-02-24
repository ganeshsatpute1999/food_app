import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final String imageUrl;

  const RecipeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl.isNotEmpty ? imageUrl : "https://via.placeholder.com/250",
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
