import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatelessWidget {
  final String clienteName;

  ChatDetailsScreen({required this.clienteName});

  final List<Map<String, String>> messages = [
    {'sender': 'Cliente', 'message': 'Hola, ¿puede ayudarme con mi caso?'},
    {'sender': 'Abogado', 'message': 'Por supuesto, ¿en qué área necesita ayuda?'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat con $clienteName"),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
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

