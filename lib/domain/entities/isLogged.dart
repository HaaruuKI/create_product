// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FunctionIsLogged {
  static Future<void> isLoggedFunction(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.pushReplacementNamed(
            context, 'login'); // Redirige al usuario al inicio de sesión
      } else {
        print('User is signed in!');
      }
    });
  }
}
