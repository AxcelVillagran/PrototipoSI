import 'package:flutter/material.dart';

class SubirReclamoScreen extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  String _selectedCategoria = "Seleccionar";

  void _showReclamoEnviadoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reclamo enviado"),
          content: Text("Su reclamo ha sido enviado con éxito."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la ventana emergente
              },
              child: Text("Cerrar", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 16),
            alignment: Alignment.center,
            child: Text(
              "Subir Reclamo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _tituloController,
                    decoration: InputDecoration(labelText: "Título del Reclamo"),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedCategoria,
                    items: ["Seleccionar", "Categoría 1", "Categoría 2", "Categoría 3"]
                        .map((categoria) => DropdownMenuItem(
                              value: categoria,
                              child: Text(categoria),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _selectedCategoria = value!;
                    },
                    decoration: InputDecoration(labelText: "Seleccione una categoría"),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: InputDecoration(labelText: "Descripción del Reclamo"),
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para enviar reclamo (puedes agregar más aquí si es necesario)
                      _showReclamoEnviadoDialog(context); // Muestra la ventana emergente
                    },
                    child: Text("Enviar Reclamo", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
