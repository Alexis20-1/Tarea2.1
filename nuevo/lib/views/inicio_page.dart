import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla de Inicio')),
      body: const Center(
        child: Text('¡Bienvenido a la app!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}