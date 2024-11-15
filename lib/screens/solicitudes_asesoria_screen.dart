import 'package:flutter/material.dart';

class SolicitudesAsesoriaScreen extends StatelessWidget {
  final List<Map<String, String>> solicitudes = [
    {'cliente': 'Juan Pérez', 'descripcion': 'Asesoría en Derecho Civil', 'fecha': '2023-10-10'},
    {'cliente': 'Ana García', 'descripcion': 'Consulta sobre bienes raíces', 'fecha': '2023-10-12'},
    {'cliente': 'Luis Rodríguez', 'descripcion': 'Asesoría en compra de vehículo', 'fecha': '2023-10-15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitudes de Asesoría"),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: solicitudes.length,
        itemBuilder: (context, index) {
          final solicitud = solicitudes[index];
          return Card(
            child: ListTile(
              title: Text(solicitud['cliente']!),
              subtitle: Text(
                '${solicitud['descripcion']} - Fecha: ${solicitud['fecha']}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Acción para ver detalles o aceptar la solicitud
                },
                child: Text('Ver Detalles'),
              ),
            ),
          );
        },
      ),
    );
  }
}
