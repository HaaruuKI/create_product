import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FunctionUpdateProduct {
  static String? imageUrl;
  static Uint8List? fileBytes;
  static String? fileName;

  Future<void> uploadFile(Function setStateImage) async {
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
      setStateImage();
    }
  }
}
