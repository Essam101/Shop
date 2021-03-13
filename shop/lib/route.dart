import 'package:flutter/material.dart';

import 'screens/home/homeScreen.dart';
import 'screens/login/loginScreen.dart';
import 'screens/navigation/navigationScreen.dart';
import 'screens/splash/splashScreen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.id: (_) => SplashScreen(),
    NavigationScreen.id: (_) => NavigationScreen(),
    HomeScreen.id: (_) => HomeScreen(),
    LoginScreen.id: (_) => LoginScreen(),
  };

  static Map<String, WidgetBuilder> getAll() => routes;

  static WidgetBuilder getRouteByName(String name) {
    if (routes.containsKey(name) == false) {
      return routes[NavigationScreen.id];
    }
    return routes[name];
  }
}
