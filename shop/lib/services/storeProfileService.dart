import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/models/StoreProfileModel.dart';

class StoreProfileService with ChangeNotifier {
  List<QueryDocumentSnapshot> _storeProfile;

  getStoreProfile({String userId}) async {
    FirebaseFirestore.instance
        .collection('storeProfile')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) => {_storeProfile = value.docs});
    notifyListeners();
  }

  addStoreProfile({String userId, StoreProfileModel storeProfileModel}) async {
    FirebaseFirestore.instance
        .collection('storeProfile')
        .add(storeProfile.map((e, x) => {e, x}));

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
