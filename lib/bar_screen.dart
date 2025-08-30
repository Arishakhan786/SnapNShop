import 'package:flutter/material.dart';
import 'package:frehas_task/Home/home_screen.dart';
import 'package:frehas_task/favorites/favorites_screen.dart';

// Import your real screens
import 'package:frehas_task/visual%20search/visual_search_screen.dart';
import 'package:frehas_task/cart/cart_screen.dart';
import 'package:frehas_task/profile/profile_scren.dart';

import 'Home/categories_screen.dart' show CategoriesScreen;

class BarScreen extends StatefulWidget {
  const BarScreen({super.key});

  @override
  State<BarScreen> createState() => _BarScreenState();
}

class _BarScreenState extends State<BarScreen> {
  int _currentIndex = 0;

  // 👇 Added HomeScreen as the first element
  final List<Widget> _screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const VisualSearchScreen(),
    const CartScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed, // needed for >3 items
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Visual",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
