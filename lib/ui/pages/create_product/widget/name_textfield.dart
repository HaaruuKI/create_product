import 'package:flutter/material.dart';

Widget nameTextField(TextEditingController nameController) {
  return TextField(
    controller: nameController,
    decoration: const InputDecoration(
      labelText: 'Name',
    ),
  );
}
