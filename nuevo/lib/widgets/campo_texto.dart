import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icono;
  final bool esContrasena;
  final bool mostrarTexto;
  final VoidCallback? alternarVisibilidad;

  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    required this.icono,
    this.esContrasena = false,
    this.mostrarTexto = false,
    this.alternarVisibilidad,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: esContrasena && !mostrarTexto,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icono),
        suffixIcon: esContrasena
            ? IconButton(
          icon: Icon(mostrarTexto ? Icons.visibility : Icons.visibility_off),
          onPressed: alternarVisibilidad,
        )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}