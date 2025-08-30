import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      initialRoute: AppRoutes.login, // 👈 default page
      routes: AppRoutes.routes, // 👈 centralized navigation
    );
  }
}
