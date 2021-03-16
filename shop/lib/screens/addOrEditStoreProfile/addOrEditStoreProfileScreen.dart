import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/image.dart';

import '../../services/userService.dart';

class AddOrEditStoreProfileScreen extends StatefulWidget {
  static const id = "/addOrEditStoreProfileScreen";

  @override
  _AddOrEditStoreProfileScreenState createState() =>
      _AddOrEditStoreProfileScreenState();
}

class _AddOrEditStoreProfileScreenState
    extends State<AddOrEditStoreProfileScreen> {
  File _image;
  ImageServices _imageServices = new ImageServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: RawMaterialButton(
          fillColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
          elevation: 8,
          onPressed: () async {
            await _imageServices.uploadFile(
                context: context,
                folderName: "uploads",
                imagePath: _image.path,
                fileName: "Store",
                metaId: "userId");
          },
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: _image == null
                  ? Center(
                      child: Text('No image selected.'),
                    )
                  : Image.file(
                      _image,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_photo_alternate_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () async {
                    var image = await _imageServices.selectImage();
                    setState(() {
                      _image = image;
                    });
                  },
                  padding: EdgeInsets.all(15),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                  ),
                  onPressed: () async {
                    var image = await _imageServices.takeImage();
                    setState(() {
                      _image = image;
                    });
                  },
                  padding: EdgeInsets.all(15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
