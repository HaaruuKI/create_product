// ignore_for_file: avoid_print

import 'package:create_product/ui/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/login/funtion_login.dart';

Widget buttonLogin(
    TextEditingController emailController,
    TextEditingController passwordController,
    bool cargando,
    BuildContext context,
    GlobalKey<FormState> formKey,
    Function funtionCargar,
    Function funtionCargarTerminado) {
  return ElevatedButton(
    style: buttonPrimary,
    onPressed: () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print(user);
          FunctionGetLogin.signInWithEmailAndPassword(
              emailController,
              formKey,
              passwordController,
              cargando,
              context,
              funtionCargar,
              funtionCargarTerminado);
        } else {
          print(user);
          Navigator.pushReplacementNamed(context, 'menu');
        }
      });
    },
    child: const Text('Iniciar sesión'),
  );
}
