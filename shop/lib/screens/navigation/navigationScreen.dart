import 'package:flutter/material.dart';
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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 3: Settings', style: optionStyle)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationScreen '),
        centerTitle: true,
      ),
      drawer: DrawerWidget(context: context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        callback: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
