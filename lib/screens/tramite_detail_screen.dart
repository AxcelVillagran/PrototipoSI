import 'package:flutter/material.dart';

class TramiteDetailScreen extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> tramites;

  TramiteDetailScreen({required this.title, required this.tramites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
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
