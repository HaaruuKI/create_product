import 'package:flutter/material.dart';

Widget deleteWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        // Lógica para eliminar un elemento existente
      },
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text('Eliminar'),
        ),
      ),
    ),
  );
}
