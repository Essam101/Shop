import 'package:flutter/material.dart';
import 'package:shop/models/StoresModel.dart';
import 'package:shop/services/storeService.dart';

class StoresScreen extends StatefulWidget {
  static const String id = "/storesScreen";

  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  StoreService _storeService = new StoreService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await _storeService.getStores();
    await _storeService.getStoreById(3);
    await _storeService.updateStore(StoresModel(
        creationDate: DateTime.now(),
        currency: "",
        image: "",
        numbersOfUsers: 0,
        storeDetails: "",
        storeId: 1,
        storeName: "",
        workActivity: ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
        centerTitle: true,
      ),
      body: Center(child: Text("fsads")),
    );
  }
}
