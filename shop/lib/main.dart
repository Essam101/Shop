import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/services/storeProfileService.dart';

import 'core/preferences.dart';
import 'models/prefModel.dart';
import 'route.dart';
import 'screens/splashScreen.dart';
import 'services/userService.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Preferences _preferences = new Preferences();
  await Firebase.initializeApp();
  String localUrl = "https://192.168.1.100:5001/api/";

  if (kReleaseMode) {
    await _preferences.setPreferences(
        key: PrefModel.baseUrl, type: " ", val: localUrl);
  } else {
    await _preferences.setPreferences(
        key: PrefModel.baseUrl, type: " ", val: localUrl);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => StoreProfileService()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: SplashScreen.id,
          routes: Routes.routes),
    );
  }
}
