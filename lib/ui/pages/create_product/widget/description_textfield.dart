import 'package:flutter/material.dart';

Widget descriptionTextField(TextEditingController descriptionController) {
  return TextField(
    controller: descriptionController,
    decoration: const InputDecoration(
      labelText: 'Description',
    ),
  );
}
