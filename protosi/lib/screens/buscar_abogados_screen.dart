import 'package:flutter/material.dart';

class BuscarAbogadosScreen extends StatefulWidget {
  @override
  _BuscarAbogadosScreenState createState() => _BuscarAbogadosScreenState();
}

class _BuscarAbogadosScreenState extends State<BuscarAbogadosScreen> {
  String categoria = '';
  String orden = '';
  double? maxPrecio;
  final TextEditingController maxPrecioController = TextEditingController();

  final List<Map<String, dynamic>> abogados = [
    {'nombre': 'Ana García', 'especialidad': 'Compra de Vehículos', 'rating': 4.8, 'asesorias': 20, 'precio': 100},
    {'nombre': 'Carlos Rodríguez', 'especialidad': 'Bienes Raíces', 'rating': 4.5, 'asesorias': 15, 'precio': 120},
    {'nombre': 'María López', 'especialidad': 'Tecnología', 'rating': 4.9, 'asesorias': 30, 'precio': 150},
  ];

  List<Map<String, dynamic>> getAbogadosFiltrados() {
    List<Map<String, dynamic>> filtered = abogados.where((abogado) {
      return (categoria.isEmpty || abogado['especialidad'] == categoria) &&
             (maxPrecio == null || abogado['precio'] <= maxPrecio!);
    }).toList();

    if (orden == 'valoracion') {
      filtered.sort((a, b) => b['rating'].compareTo(a['rating']));
    } else if (orden == 'asesorias') {
      filtered.sort((a, b) => b['asesorias'].compareTo(a['asesorias']));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Abogados"),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: categoria.isEmpty ? null : categoria,
              hint: Text('Filtrar por Especialidad'),
              items: [
                'Compra de Vehículos',
                'Bienes Raíces',
                'Tecnología',
                'Derecho Civil',
                'Derecho Penal',
              ].map((String value) {
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
              controller: maxPrecioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio máximo'),
              onChanged: (value) {
                setState(() {
                  maxPrecio = double.tryParse(value);
                });
              },
            ),
            DropdownButton<String>(
              value: orden.isEmpty ? null : orden,
              hint: Text('Ordenar por'),
              items: [
                {'value': 'valoracion', 'label': 'Valoración'},
                {'value': 'asesorias', 'label': 'Número de Asesorías'},
              ].map((item) {
                return DropdownMenuItem<String>(
                  value: item['value'],
                  child: Text(item['label']!),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  orden = value ?? '';
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getAbogadosFiltrados().length,
                itemBuilder: (context, index) {
                  final abogado = getAbogadosFiltrados()[index];
                  return Card(
                    child: ListTile(
                      title: Text(abogado['nombre']),
                      subtitle: Text(
                        'Especialidad: ${abogado['especialidad']} - Valoración: ${abogado['rating']} - Asesorías: ${abogado['asesorias']} - Precio: \$${abogado['precio']}',
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Acción para contactar al abogado
                        },
                        child: Text('Contactar'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
