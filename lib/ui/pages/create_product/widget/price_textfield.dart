import 'package:flutter/material.dart';

Widget priceTextField(TextEditingController priceController) {
  return TextField(
    controller: priceController,
    decoration: const InputDecoration(
      labelText: 'Price',
    ),
  );
}
