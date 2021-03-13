import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/services/loginService.dart';

import 'screens/home/homeScreen.dart';
import 'screens/login/loginScreen.dart';
import 'screens/navigation/navigationScreen.dart';
import 'screens/splash/splashScreen.dart';
import 'services/userService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (_) => SplashScreen(),
          NavigationScreen.id: (_) => NavigationScreen(),
          HomeScreen.id: (_) => HomeScreen(),
          LoginScreen.id: (_) => LoginScreen(),
        },
      ),
    );
  }
}
