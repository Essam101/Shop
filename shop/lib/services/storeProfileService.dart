import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/StoreProfileModel.dart';
import 'package:shop/services/userService.dart';

class StoreProfileService with ChangeNotifier {
  List<QueryDocumentSnapshot> _storeProfile;

  getStoreProfile({BuildContext context, String userId}) async {
    FirebaseFirestore.instance
        .collection('storeProfile')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) => {_storeProfile = value.docs});
    notifyListeners();
  }

  addStoreProfile({BuildContext context, StoreProfileModel model}) async {
    var userId = Provider.of<UserService>(context, listen: false)
        .userCredential
        .user
        .uid;
    model.userId = userId;
    FirebaseFirestore.instance.collection('storeProfile').add(model.toJson());
    notifyListeners();
  }

  editStoreProfile() async {}

  deleteStoreProfile() async {}

  List<QueryDocumentSnapshot> get storeProfile => _storeProfile;

  set storeProfile(List<QueryDocumentSnapshot> x) {
    _storeProfile = x;
    notifyListeners();
  }
}
