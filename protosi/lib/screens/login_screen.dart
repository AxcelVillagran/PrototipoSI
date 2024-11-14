import 'package:flutter/material.dart';
import 'cliente_actions_screen.dart';
import 'solicitudes_asesoria_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isCliente = true;

  void handleLogin() {
    if (isCliente) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClienteActionsScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SolicitudesAsesoriaScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AsesoriLegal"),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ingresar como: "),
                DropdownButton<bool>(
                  value: isCliente,
                  items: [
                    DropdownMenuItem(
                      value: true,
                      child: Text("Cliente"),
                    ),
                    DropdownMenuItem(
                      value: false,
                      child: Text("Abogado"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      isCliente = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: handleLogin,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
