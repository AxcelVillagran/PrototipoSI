import 'package:flutter/material.dart';
import 'cliente_actions_screen.dart';
import 'abogado_actions_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = "Cliente";

  void _login() {
    if (_selectedRole == "Cliente") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ClienteActionsScreen()),
      );
    } else if (_selectedRole == "Abogado") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AbogadoActionsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AsesoriLegal"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: ["Cliente", "Abogado"]
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
                decoration: InputDecoration(labelText: "Seleccione Rol"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Usuario"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Contraseña"),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                child: Text("Iniciar Sesión"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
