import 'package:flutter/material.dart';

Widget updateWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        // Lógica para actualizar un elemento existente
      },
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text('Actualizar'),
        ),
      ),
    ),
  );
}
