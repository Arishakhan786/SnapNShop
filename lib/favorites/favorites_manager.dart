import 'package:frehas_task/Home/home_screen.dart';

class FavoritesManager {
  static final List<Product> _favorites = [];

  static List<Product> get favorites => _favorites;

  static void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
  }

  static bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
