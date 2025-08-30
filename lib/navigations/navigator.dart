import 'package:flutter/material.dart';

// Auth screens
import 'package:frehas_task/auth_screens/forget_pass.dart';
import 'package:frehas_task/auth_screens/login.dart';
import 'package:frehas_task/auth_screens/signup.dart';
import 'package:frehas_task/bar_screen.dart';
import 'package:frehas_task/cart/check_out.dart';
import 'package:frehas_task/cart/succes.dart';
import 'package:frehas_task/profile/order_screen.dart';
import 'package:frehas_task/profile/orders_detail_screen.dart';
import 'package:frehas_task/profile/setting_screen.dart';

// Visual search
import 'package:frehas_task/visual%20search/crop_item_screen.dart';
import 'package:frehas_task/visual%20search/finding_results_screen.dart';
import 'package:frehas_task/visual%20search/take_photo_screen.dart';

// Bottom navigation screens (dummy placeholders for now)

class AppRoutes {
  // Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgot = '/forgot';

  // Visual Search
  static const String visual_search = '/visual_search';
  static const String crop_item = '/crop_item';
  static const String take_photo = '/take_photo';
  static const String finding_results = '/finding_results';
  static const String orders = '/orders';

  // Bottom Nav Screens
  static const String home = '/home';
  static const String shop = '/shop';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String bar = '/bar';
  static const String orderConfirmation = '/orderConfirmation';
  static const String orderDetails = '/orderDetails';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    // Auth
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    forgot: (context) => const ForgotPasswordScreen(),
    bar: (context) => const BarScreen(),
    // Visual Search
    crop_item: (context) => const CropItemScreen(),
    take_photo: (context) => const TakePhotoScreen(),
    finding_results: (context) => const FindingResultsScreen(),
    orderConfirmation: (context) => const OrderConfirmationScreen(),

    // Bottom Nav Screens
    checkout: (context) => const CheckoutScreen(),
    orders: (context) => const OrdersScreen(),
    orderDetails: (context) => const OrderDetailsScreen(),
    settings: (context) => const SettingsScreen(),
  };
}
