import 'package:flutter/material.dart';
import 'tramite_detail_screen.dart';

class TramitesLegalesScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> tramites = {
    "Derecho Civil": [
      {"title": "Trámite de Contrato", "documents": ["ID", "Contrato firmado", "Prueba de domicilio"]},
      {"title": "Certificación de Acta", "documents": ["ID", "Acta de nacimiento", "Comprobante de pago"]},
    ],
    "Bienes Raíces": [
      {"title": "Registro de Propiedad", "documents": ["ID", "Título de propiedad", "Prueba de pago"]},
      {"title": "Cambio de Propietario", "documents": ["ID", "Título anterior", "Comprobante de venta"]},
    ],
    "Tecnología": [
      {"title": "Registro de Patente", "documents": ["ID", "Formulario de solicitud", "Descripción técnica"]},
      {"title": "Certificación de Marca", "documents": ["ID", "Diseño de marca", "Comprobante de pago"]},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tramites Legales"),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: tramites.keys.map((area) {
          return Card(
            child: ListTile(
              title: Text(area),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TramiteDetailScreen(
                      title: area,
                      tramites: tramites[area]!,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
