import 'package:create_product/domain/entities/create_product/funtion_create_product.dart';
import 'package:flutter/material.dart';

Widget saveFileButton(Function setStateImage) {
  return ElevatedButton(
    onPressed: () {
      FuntionCreateProduct().saveProduct(setStateImage);
    },
    child: const Text('Save Product'),
  );
}
