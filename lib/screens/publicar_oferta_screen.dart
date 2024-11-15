import 'package:flutter/material.dart';

class PublicarOfertaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String titulo = '';
    String descripcion = '';
    String precio = '';

    return Scaffold(

      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Text(
              'Publicar Oferta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
              TextFormField(
                decoration: InputDecoration(labelText: "Título de la Asesoría"),
                onChanged: (value) => titulo = value,
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Descripción"),
                onChanged: (value) => descripcion = value,
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Precio (en USD)"),
                keyboardType: TextInputType.number,
                onChanged: (value) => precio = value,
                validator: (value) => value!.isEmpty ? "Campo requerido" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Logic to publish the asesoria
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Oferta publicada exitosamente")),
                    );
                  }
                },
                child: Text("Publicar Asesoría"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
