import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/navigation.dart';

import 'package:shop/services/userService.dart';

import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "/splashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Navigation _navigation;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 700)).then((_) {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}
