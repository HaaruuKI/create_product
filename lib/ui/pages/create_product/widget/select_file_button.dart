import 'package:create_product/domain/entities/create_product/funtion_create_product.dart';
import 'package:flutter/material.dart';

Widget selectFileButton(Function setStateImage) {
  return ElevatedButton(
    onPressed: () {
      FuntionCreateProduct().uploadFile(setStateImage);
    },
    child: const Text('Select File'),
  );
}
