import 'package:flutter/material.dart';

Widget readWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        // Lógica para leer un elemento existente
      },
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text('Leer'),
        ),
      ),
    ),
  );
}
