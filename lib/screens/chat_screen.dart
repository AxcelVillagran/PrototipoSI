import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String asesoriaTitle;

  ChatScreen({required this.asesoriaTitle});

  // Sample chat messages
  final List<Map<String, String>> messages = [
    {'sender': 'Cliente', 'message': 'Hola, ¿puedo obtener ayuda con mi caso?'},
    {'sender': 'Abogado', 'message': 'Por supuesto, ¿en qué área necesita ayuda?'},
    {'sender': 'Cliente', 'message': 'En derecho civil, sobre un contrato de arrendamiento.'},
    {'sender': 'Abogado', 'message': 'Perfecto, le explico los pasos a seguir...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(asesoriaTitle,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message['sender']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(message['message']!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Placeholder for sending a message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
