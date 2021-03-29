import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/StoresModel.dart';
import 'package:shop/services/storeService.dart';
import 'package:shop/services/userService.dart';

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
    getData(context);
  }

  getData(BuildContext context) async {
    final _userService = Provider.of<UserService>(context, listen: false);
    // await _storeService.getStores();
    // await _storeService.getUserStore(_userService.userCredential.user.uid);
    /* await _storeService.updateStore(StoresModel(
        workActivity: "",
        storeName: "Essam Salehdsfa",
        storeId: 0,
        storeDetails: "",
        numbersOfUsers: 0,
        image: "",
        currency: "",
        creationDate: DateTime.now(),
        userId: _userService.userCredential.user.uid));
      await _storeService.addStore(StoresModel(
        workActivity: "",
        storeName: "Essam Saleh",
        storeId: 0,
        storeDetails: "",
        numbersOfUsers: 0,
        image: "",
        currency: "",
        creationDate: DateTime.now(),
        userId: _userService.userCredential.user.uid));*/
    await _storeService.deleteStore(_userService.userCredential.user.uid);
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
