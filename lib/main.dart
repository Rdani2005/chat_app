import 'package:flutter/material.dart';
import 'package:chat_app/routes/routes.dart';

void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
