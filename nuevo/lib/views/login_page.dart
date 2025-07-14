import 'package:flutter/material.dart';
import '../widgets/campo_texto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final correoCtrl = TextEditingController();
  final cuentaCtrl = TextEditingController();
  bool mostrar = false;

  void mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void iniciarSesion() {
    final correo = correoCtrl.text.trim();
    final cuenta = cuentaCtrl.text.trim();

    if (correo.endsWith('@unah.hn') && cuenta == '20212030973') {
      Navigator.pushReplacementNamed(context, '/inicio');
    } else {
      mostrarError('Correo o cuenta incorrectos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CampoTexto(controller: correoCtrl, label: 'Correo institucional', icono: Icons.email),
            const SizedBox(height: 16),
            CampoTexto(
              controller: cuentaCtrl,
              label: 'Número de cuenta',
              icono: Icons.lock,
              esContrasena: true,
              mostrarTexto: mostrar,
              alternarVisibilidad: () => setState(() => mostrar = !mostrar),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: iniciarSesion, child: const Text('Ingresar')),
          ],
        ),
      ),
    );
  }
}