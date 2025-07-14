import 'package:flutter/material.dart';
import '../views/registro_page.dart';
import '../views/login_page.dart';
import '../views/inicio_page.dart';

class AppRoutes {
  static const String registro = '/registro';
  static const String login = '/login';
  static const String inicio = '/inicio';

  static final Map<String, WidgetBuilder> routes = {
    registro: (_) => const RegistroPage(),
    login: (_) => const LoginPage(),
    inicio: (_) => const InicioPage(),
  };
}