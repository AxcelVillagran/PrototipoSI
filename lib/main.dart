import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cliente_actions_screen.dart';
import 'screens/abogado_actions_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AsesoriLegal',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/cliente': (context) => ClienteActionsScreen(),
        '/abogado': (context) => AbogadoActionsScreen(),
      },
    );
  }
}
