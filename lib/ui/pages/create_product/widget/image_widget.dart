import 'package:create_product/domain/entities/create_product/funtion_create_product.dart';
import 'package:flutter/material.dart';

Widget imageWidget() {
  return Image.network(
    FuntionCreateProduct.imageUrl!,
    key: ValueKey(FuntionCreateProduct.imageUrl),
    width: 300,
    height: 400,
    fit: BoxFit.cover,
  );
}
