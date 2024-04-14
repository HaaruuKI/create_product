import 'package:flutter/material.dart';

Widget buttonRecoverPassword(BuildContext context) {
  return Column(
    children: [
      const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.0),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'recoverPass');
        },
        child: const Text(
          'Recuperar',
          style: TextStyle(
              color: Color.fromARGB(255, 247, 196, 31),
              fontWeight: FontWeight.w400,
              fontSize: 20.0),
        ),
      ),
    ],
  );
}
