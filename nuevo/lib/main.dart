import 'package:flutter/material.dart';
import 'urls/app_urls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Registro/Login',
      initialRoute: AppRoutes.registro,
      routes: AppRoutes.routes,
    );
  }
}