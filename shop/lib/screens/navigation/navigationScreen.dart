import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/addOrEditStoreProfile/addOrEditStoreProfileScreen.dart';
import 'package:shop/screens/home/homeScreen.dart';

import 'component/bottomNavigationBarWidget.dart';
import 'component/drawerWidget.dart';

class NavigationScreen extends StatefulWidget {
  static const id = "navigationScreen";

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Index 1: Business'),
    AddOrEditStoreProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationScreen '),
        centerTitle: true,
      ),
      drawer: DrawerWidget(context: context),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBarWidget(
        callback: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
