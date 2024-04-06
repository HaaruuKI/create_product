import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FuntionCreateProduct {
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController priceController = TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();
  static final List<String> categories = [
    'comida',
    'bebida',
    'snack',
    'temporada'
  ];
  static String? selectedCategory;

  static Uint8List? fileBytes;
  static String? fileName;
  static String? imageUrl;
  // static String? downloadUrl;

  static Future<void> saveProduct(Function imageUrlGet) async {
    String name = FuntionCreateProduct.nameController.text
        .toLowerCase(); // Convert name to lowercase
    int price = int.parse(FuntionCreateProduct.priceController.text);
    String description = FuntionCreateProduct.descriptionController.text
        .toLowerCase(); // Convert description to lowercase

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
      FuntionCreateProduct.nameController.clear();
      FuntionCreateProduct.priceController.clear();
      FuntionCreateProduct.descriptionController.clear();
    } else {
      await uploadFile(imageUrlGet);
      print('Please select a file, enter a name, and select a category');
    }
  }

  static Future<bool> _checkProductExists(String name) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('products')
        .where('name', isEqualTo: name)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> uploadFile(Function imageUrlGet) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileBytes = result.files.first.bytes!;
      fileName = result.files.first.name;

      // Upload file
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);

      // // Get download URL
      // String downloadUrl = await FirebaseStorage.instance
      //     .ref('uploads/$fileName')
      //     .getDownloadURL();
      getDownloadUrl();
      imageUrlGet();
    }
  }

  static Future<String?> getDownloadUrl() async {
    String? downloadUrl = await FirebaseStorage.instance
        .ref('uploads/$fileName')
        .getDownloadURL();
    return downloadUrl;
  }
}
