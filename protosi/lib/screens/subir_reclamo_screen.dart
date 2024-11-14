import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SubirReclamoScreen extends StatefulWidget {
  @override
  _SubirReclamoScreenState createState() => _SubirReclamoScreenState();
}

class _SubirReclamoScreenState extends State<SubirReclamoScreen> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  String categoria = '';
  List<String> documentos = [];

  void handleSubmit() {
    print('Reclamo enviado: ${tituloController.text}, ${descripcionController.text}, $categoria, $documentos');
    // Lógica para procesar el reclamo
  }

  Future<void> selectDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        documentos = result.paths.map((path) => path!).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subir Reclamo"),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Subir Reclamo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Título del Reclamo'),
            ),
            DropdownButton<String>(
              value: categoria.isEmpty ? null : categoria,
              hint: Text('Seleccione una categoría'),
              items: ['Derecho Civil', 'Derecho Penal', 'Derecho Laboral', 'Derecho Familiar', 'Otro']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  categoria = value ?? '';
                });
              },
            ),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción del Reclamo'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectDocuments,
              child: Text('Seleccionar Documentos Adjuntos'),
            ),
            SizedBox(height: 8),
            Text('Documentos seleccionados: ${documentos.join(', ')}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text('Enviar Reclamo'),
            ),
          ],
        ),
      ),
    );
  }
}
