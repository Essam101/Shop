import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shop/services/loginService.dart';
import 'package:shop/services/userService.dart';

import '../navigation/navigationScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailController = "essamsaleh101";
  String passwordController = "Essam 101";
  UserAndPasswordAuth userAndPasswordAuth = new UserAndPasswordAuth();
  GoogleAuth googleAuth = new GoogleAuth();
  FacebookAuth facebookAuth = new FacebookAuth();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Center(
                  child: Text(
                userService.isLoggedIn.toString(),
                style: TextStyle(fontSize: 30),
              )),
              SizedBox(height: 48.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                initialValue: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onChanged: (val) {
                  setState(() {
                    emailController = val;
                  });
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                initialValue: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onChanged: (val) {
                  setState(() {
                    passwordController = val;
                  });
                },
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () async {
                    await userAndPasswordAuth.signUp(
                      context: context,
                      email: emailController.trim(),
                      password: passwordController.trim(),
                    );
                    if (userService.isLoggedIn)
                      Navigator.pushReplacementNamed(
                          context, NavigationScreen.id);
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text('Log In', style: TextStyle(color: Colors.white)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.google,
                          size: 30, color: Colors.red),
                      onPressed: () async {
                        await googleAuth.login(context: context);
                        if (userService.isLoggedIn)
                          Navigator.pushReplacementNamed(
                              context, NavigationScreen.id);
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook,
                          size: 30, color: Colors.blue),
                      onPressed: () async {
                        await facebookAuth.login();
                        if (userService.isLoggedIn)
                          Navigator.pushReplacementNamed(
                              context, NavigationScreen.id);
                      })
                ],
              ),
              TextButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
