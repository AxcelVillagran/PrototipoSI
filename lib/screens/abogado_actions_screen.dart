import 'package:flutter/material.dart';
import 'mis_solicitudes_screen.dart';
import 'publicar_oferta_screen.dart';

class AbogadoActionsScreen extends StatefulWidget {
  @override
  _AbogadoActionsScreenState createState() => _AbogadoActionsScreenState();
}

class _AbogadoActionsScreenState extends State<AbogadoActionsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MisSolicitudesScreen(),
    PublicarOfertaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abogado - AsesoriLegal"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text(
                'Opciones Abogado',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Mis Solicitudes"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Publicar Oferta"),
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
