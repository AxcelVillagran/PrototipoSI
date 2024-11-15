import 'package:flutter/material.dart';
import 'chat_details_screen.dart';

class MisSolicitudesScreen extends StatelessWidget {
  final List<Map<String, String>> solicitudes = [
    {'cliente': 'Juan Pérez', 'detalle': 'Asesoría en Derecho Civil - Fecha: 2023-10-10'},
    {'cliente': 'Ana García', 'detalle': 'Consulta sobre bienes raíces - Fecha: 2023-10-12'},
    {'cliente': 'Luis Rodríguez', 'detalle': 'Asesoría en compra de vehículo - Fecha: 2023-10-15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 16),
            alignment: Alignment.center,
            child: Text(
              "Solicitudes de Asesoría",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: solicitudes.length,
              itemBuilder: (context, index) {
                final solicitud = solicitudes[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          solicitud['cliente']!,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(solicitud['detalle']!),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatDetailsScreen(clienteName: solicitud['cliente']!),
                                ),
                              );
                            },
                            child: Text("Ver Detalles"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
