import 'package:flutter/material.dart';

void main() {
  runApp(SimpleChatApp());
}

class SimpleChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat App',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Message> _messages = [
    Message(text: 'Hello!'),
    Message(text: 'How are you?'),
    Message(text: 'I\'m good, thanks!'),
    Message(text: 'What about you?'),
    Message(text: 'I\'m doing great!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Chat App'),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('User')),
            title: Text('User Name'),
            subtitle: Text(_messages[index].text),
          );
        },
      ),
    );
  }
}

class Message {
  final String text;

  Message({required this.text});
}
