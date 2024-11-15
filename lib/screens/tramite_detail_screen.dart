import 'package:flutter/material.dart';

class TramiteDetailScreen extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> tramites;

  TramiteDetailScreen({required this.title, required this.tramites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tramites.length,
        itemBuilder: (context, index) {
          final tramite = tramites[index];
          return Card(
            child: ExpansionTile(
              title: Text(tramite["title"]),
              children: tramite["documents"].map<Widget>((document) {
                return ListTile(
                  title: Text(document),
                  leading: Icon(Icons.description),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
