import 'package:flutter/material.dart';
import 'package:shop/screens/StoresScreen.dart';

import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/navigationScreen.dart';
import 'screens/splashScreen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.id: (_) => SplashScreen(),
    NavigationScreen.id: (_) => NavigationScreen(),
    HomeScreen.id: (_) => HomeScreen(),
    LoginScreen.id: (_) => LoginScreen(),
    StoresScreen.id: (_) => StoresScreen(),
  };

  static Map<String, WidgetBuilder> getAll() => routes;

  static WidgetBuilder getRouteByName(String name) {
    if (routes.containsKey(name) == false) {
      return routes[NavigationScreen.id];
    }
    return routes[name];
  }
}
