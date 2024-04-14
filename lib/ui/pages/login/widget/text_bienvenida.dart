import 'package:create_product/ui/colors.dart';
import 'package:flutter/material.dart';

Widget textBienvenida() {
  return const Column(
    children: [
      Text(
        'Bienvenido a',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50.0),
      ),
      Text(
        'FOODIE APP ADMIN',
        style:
            TextStyle(color: gris, fontWeight: FontWeight.w700, fontSize: 30.0),
      ),
    ],
  );
}
