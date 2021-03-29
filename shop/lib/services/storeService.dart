import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop/core/api.dart';
import 'package:shop/models/StoresModel.dart';

class StoreService extends Api with ChangeNotifier {
  List<StoresModel> storesModel;
  StoresModel storeModel;

  getStores() async {
    await get(url: "Stores").then((value) {
      if (value.isValid) {
        JsonCodec codec = new JsonCodec();
        storesModel = storesModelFromJson(codec.encode(value.model));
      }
    });
  }

  getUserStore(userId) async {
    await get(url: "Stores/GetUserStore?userId=$userId").then((value) {
      if (value.isValid) {
        print(value.model);
        JsonCodec codec = new JsonCodec();
        storeModel = storeModelFromJson(codec.encode(value.model));
      }
    });
  }

  updateStore(StoresModel storesModel) async {
    await put(url: "Stores/Update", body: jsonEncode(storesModel.toJson()))
        .then((value) {
      if (value.isValid) {
        JsonCodec codec = new JsonCodec();
        storeModel = storeModelFromJson(codec.encode(value.model));
      }
    });
  }
  addStore(StoresModel storesModel) async {
    await post(url: "Stores/Add", body: jsonEncode(storesModel.toJson()))
        .then((value) {
      if (value.isValid) {
        JsonCodec codec = new JsonCodec();
        storeModel = storeModelFromJson(codec.encode(value.model));
      }
    });
  }
}
