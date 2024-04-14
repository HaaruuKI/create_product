// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:create_product/domain/entities/create_product/funtion_create_product.dart';
import 'package:create_product/ui/pages/create_product/widget/description_textfield.dart';
import 'package:create_product/ui/pages/create_product/widget/image_widget.dart';
import 'package:create_product/ui/pages/create_product/widget/name_textfield.dart';
import 'package:create_product/ui/pages/create_product/widget/price_textfield.dart';
import 'package:create_product/ui/pages/create_product/widget/save_file_button.dart';
import 'package:create_product/ui/pages/create_product/widget/select_file_button.dart';
import 'package:create_product/ui/pages/create_product/widget/wrap_widget.dart';
import 'package:flutter/material.dart';
// import 'dart:typed_data';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  void setStateImage() {
    setState(() {});
  }

  void selectCategory(selected, category) {
    setState(() {
      FuntionCreateProduct.selectedCategory = selected ? category : null;
      print(FuntionCreateProduct.selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: FuntionCreateProduct.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: FuntionCreateProduct.priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: FuntionCreateProduct.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            wrapWidget(selectCategory),
            const SizedBox(height: 16.0),
            if (FuntionCreateProduct.imageUrl != null) imageWidget(),
            const SizedBox(height: 16.0),
            selectFileButton(setStateImage),
            const SizedBox(height: 16.0),
            saveFileButton(setStateImage),
          ],
        ),
      ),
    );
  }
}
