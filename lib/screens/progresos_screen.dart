import 'package:flutter/material.dart';

class ProgresosScreen extends StatelessWidget {
  // Lista de ítems con su progreso asociado
  final List<Map<String, dynamic>> progresos = [
    {"titulo": "Asesoria en Derecho Civil", "progreso": 0.7},
    {"titulo": "Consulta sobre bienes raíces", "progreso": 0.5},
    {"titulo": "Asesoria en compra de vehículo", "progreso": 0.9},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Título de la página
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 16),
            alignment: Alignment.center,
            child: Text(
              "Progresos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Lista de ítems con barras de progreso
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: progresos.length,
                itemBuilder: (context, index) {
                  final progreso = progresos[index];
                  final porcentaje = (progreso["progreso"] * 100).toInt();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Texto alineado a la izquierda
                          Expanded(
                            flex: 2,
                            child: Text(
                              progreso["titulo"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          // Barra de progreso y porcentaje
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: progreso["progreso"],
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.green,
                                    minHeight: 10,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "$porcentaje%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
