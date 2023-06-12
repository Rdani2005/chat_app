import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:chat_app/screens/screens.dart';

const String initialRoute = "chat";

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersScreen(),
  'chat': (_) => const ChatScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'loading': (_) => const LoadingScreen(),
};
