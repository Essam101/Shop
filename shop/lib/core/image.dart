import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../services/userService.dart';

class ImageServices {
  final picker = ImagePicker();

  Future<File> selectImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      return File(pickedFile.path);
    } on Exception catch (_) {
      return null;
    }
  }

  Future takeImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      return File(pickedFile.path);
    } on Exception catch (_) {
      return null;
    }
  }

  Future<void> uploadFile(
      {BuildContext context,
      String folderName,
      String imagePath,
      String fileName,
      String metaId}) async {
    final userService =
        Provider.of<UserService>(context, listen: false).userCredential.user;
    firebase_storage.SettableMetadata metadata =
        firebase_storage.SettableMetadata(
      customMetadata: <String, String>{
        metaId: userService.uid,
      },
    );
    File file = File(imagePath);
    await firebase_storage.FirebaseStorage.instance
        .ref('$folderName/${userService.uid + fileName}')
        .putFile(file, metadata);
  }

  Future<String> getMetadata(
      {BuildContext context,
      String folderName,
      String fileName,
      String metaId}) async {
    final userService =
        Provider.of<UserService>(context, listen: false).userCredential.user;
    firebase_storage.FullMetadata metadata = await firebase_storage
        .FirebaseStorage.instance
        .ref('$folderName/${userService.uid + fileName}')
        .getMetadata();

    return metadata.customMetadata[metaId];
  }

  Future<String> getImage({
    BuildContext context,
    String folderName,
    String fileName,
  }) async {
    final userService =
        Provider.of<UserService>(context, listen: false).userCredential.user;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('$folderName/${userService.uid + fileName}');

    return ref.getDownloadURL();
  }
}
