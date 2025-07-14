import 'package:flutter/material.dart';
import '../widgets/campo_texto.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final nombreCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final telefonoCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool mostrarPassword = false;

  void mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: Colors.red),
    );
  }

  bool esValido() {
    final correo = correoCtrl.text.trim();
    final pass = passwordCtrl.text;

    if ([nombreCtrl, correoCtrl, telefonoCtrl, passwordCtrl].any((c) => c.text.isEmpty)) {
      mostrarError('Todos los campos son obligatorios');
      return false;
    }
    if (!correo.endsWith('@unah.hn')) {
      mostrarError('El correo debe terminar en @unah.hn');
      return false;
    }
    if (pass.length < 6 || !pass.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      mostrarError('Contraseña inválida (mínimo 6 caracteres y 1 carácter especial)');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CampoTexto(controller: nombreCtrl, label: 'Nombre', icono: Icons.person),
            const SizedBox(height: 16),
            CampoTexto(controller: correoCtrl, label: 'Correo', icono: Icons.email),
            const SizedBox(height: 16),
            CampoTexto(controller: telefonoCtrl, label: 'Teléfono', icono: Icons.phone),
            const SizedBox(height: 16),
            CampoTexto(
              controller: passwordCtrl,
              label: 'Contraseña',
              icono: Icons.lock,
              esContrasena: true,
              mostrarTexto: mostrarPassword,
              alternarVisibilidad: () => setState(() => mostrarPassword = !mostrarPassword),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (esValido()) {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}