import 'package:flutter/material.dart';

class Navigation {
  void pushNamed({context, screenRout}) {
    Navigator.pushNamed(context, screenRout);
  }

  void pushReplacementNamed({BuildContext context, screenRout}) {
    Navigator.pushReplacementNamed(context, screenRout);
  }

  void push({context, Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pushReplacement({context, Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
