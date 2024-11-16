import 'package:flutter/material.dart';
import 'package:protosi/screens/login_screen.dart';
import 'buscar_abogados_screen.dart';
import 'subir_reclamo_screen.dart';
import 'mis_asesorias_screen.dart';
import 'tramites_legales_screen.dart';
import 'progresos_screen.dart';

class ClienteActionsScreen extends StatefulWidget {
  @override
  _ClienteActionsScreenState createState() => _ClienteActionsScreenState();
}

class _ClienteActionsScreenState extends State<ClienteActionsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BuscarAbogadosScreen(),
    SubirReclamoScreen(),
    MisAsesoriasScreen(),
    TramitesLegalesScreen(),
    ProgresosScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Cliente - Legaly", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text(
                'Menu Cliente',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Buscar Abogados"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.upload_file),
              title: Text("Subir Reclamo"),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("Mis Asesorias"),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Tramites Legales"),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.hourglass_bottom),
              title: Text("Progreso de tramites"),
              onTap: () => _onItemTapped(4),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("Log Out"),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                )
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
