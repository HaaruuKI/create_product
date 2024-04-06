import 'package:create_product/domain/entities/create_product/funtion_create_product.dart';
import 'package:flutter/material.dart';

Widget wrapWidget(Function selectCategory) {
  return Wrap(
    spacing: 8.0,
    children: FuntionCreateProduct.categories.map((category) {
      return FilterChip(
        label: Text(category),
        selected: FuntionCreateProduct.selectedCategory == category,
        onSelected: (selected) {
          selectCategory(selected, category);
        },
      );
    }).toList(),
  );
}
