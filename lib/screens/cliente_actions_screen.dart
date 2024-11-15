import 'package:flutter/material.dart';
import 'buscar_abogados_screen.dart';
import 'subir_reclamo_screen.dart';

class ClienteActionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acciones Cliente"),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuscarAbogadosScreen()),
                );
              },
              child: Text("Buscar Abogados"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubirReclamoScreen()),
                );
              },
              child: Text("Subir Reclamo"),
            ),
          ],
        ),
      ),
    );
  }
}
