import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MisAsesoriasScreen extends StatelessWidget {
  // Lista de asesorías de ejemplo
  final List<Map<String, String>> asesorias = [
    {'titulo': 'Asesoria en Derecho Civil', 'fecha': '2023-10-10'},
    {'titulo': 'Consulta sobre Bienes Raíces', 'fecha': '2023-10-15'},
    {'titulo': 'Asesoria en Compra de Vehículo', 'fecha': '2023-11-01'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Mis Asesorias",
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
              itemCount: asesorias.length,
              itemBuilder: (context, index) {
                final asesoria = asesorias[index];
                return Card(
                  child: ListTile(
                    title: Text(asesoria['titulo']!),
                    subtitle: Text("Fecha: ${asesoria['fecha']}"),
                    trailing: Icon(Icons.chat),
                    onTap: () {
                      // Navega a ChatScreen cuando se selecciona una asesoria
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(asesoriaTitle: asesoria['titulo']!),
                        ),
                      );
                    },
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
