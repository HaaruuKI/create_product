import 'package:create_product/ui/colors.dart';
import 'package:flutter/material.dart';

Widget buttonRegister(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('¿No tienes una cuenta?',
            style: TextStyle(
                color: gris, fontWeight: FontWeight.w400, fontSize: 20.0)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text(' Registrate',
              style: TextStyle(
                  color: Color.fromARGB(255, 247, 196, 31),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0)),
        ),
      ],
    ),
  );
}
