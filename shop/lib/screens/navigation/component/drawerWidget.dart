import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/login/loginScreen.dart';
import 'package:shop/services/userService.dart';

class DrawerWidget extends StatelessWidget {
  final context;

  const DrawerWidget({
    Key key,
    this.context,
  }) : super(key: key);

  @override
  Widget build(context) {
    final userService = Provider.of<UserService>(context, listen: true);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('logOut'),
            trailing: Wrap(
              spacing: 12,
              children: <Widget>[
                Icon(Icons.exit_to_app), //
              ],
            ),
            onTap: () async {
              await userService.signOut();
              if (!userService.isLoggedIn)
                Navigator.pushReplacementNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
