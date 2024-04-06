// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_product/ui/pages/create_product/widget/description_textfield.dart';
import 'package:create_product/ui/pages/create_product/widget/name_textfield.dart';
import 'package:create_product/ui/pages/create_product/widget/price_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> categories = ['comida', 'bebida', 'snack', 'temporada'];
  String? selectedCategory;

  Uint8List? fileBytes;
  String? fileName;
  String? imageUrl;

  Future<void> saveProduct() async {
    String name = nameController.text.toLowerCase();
    double price = double.tryParse(priceController.text) ?? 0.0;
    String description = descriptionController.text.toLowerCase();

    if (fileBytes != null && name.isNotEmpty && selectedCategory != null) {
      bool productExists = await _checkProductExists(name);

      if (productExists) {
        print('Product already exists');
        return;
      }

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> productsCollection =
          firestore.collection('products').doc(name);

      await productsCollection.set({
        'name': name,
        'price': price,
        'description': description,
        'category': selectedCategory,
        'img_url': imageUrl,
      });

      print('Product saved');
      _clearFields();
    } else {
      await uploadFile();
      print('Please select a file, enter a name, and select a category');
    }
  }

  Future<bool> _checkProductExists(String name) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('products')
        .where('name', isEqualTo: name)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileBytes = result.files.first.bytes!;
      fileName = result.files.first.name;

      // Upload file
      TaskSnapshot uploadTask = await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);

      // Get download URL
      imageUrl = await uploadTask.ref.getDownloadURL();

      setState(() {});
    }
  }

  void _clearFields() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    fileBytes = null;
    fileName = null;
    imageUrl = null;
    selectedCategory = null;
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
            nameTextField(nameController),
            const SizedBox(height: 16.0),
            priceTextField(priceController),
            const SizedBox(height: 16.0),
            descriptionTextField(descriptionController),
            const SizedBox(height: 16.0),
            const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return FilterChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = selected ? category : null;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: uploadFile,
              child: const Text('Select File'),
            ),
            const SizedBox(height: 16.0),
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                key: ValueKey(imageUrl),
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveProduct,
              child: const Text('Save Product'),
            ),
          ],
        ),
      ),
    );
  }
}
