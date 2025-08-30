import 'package:flutter/material.dart';
import 'package:frehas_task/favorites/favorites_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key}); // ✅ no product here

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesManager.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites"), centerTitle: true),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet ❤️"))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
