import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shop/services/userService.dart';

final googleSignIn = GoogleSignIn();

final _firebaseAuth = FirebaseAuth.instance;

class GoogleAuth {
  Future login({BuildContext context}) async {
    Provider.of<UserService>(context, listen: false).isSigningIn = true;
    GoogleSignInAccount user;
    user = await googleSignIn.signIn();

    if (user == null) {
      Provider.of<UserService>(context, listen: false).isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      Provider.of<UserService>(context, listen: false).userCredential =
          await _firebaseAuth
              .signInWithCredential(credential)
              .onError((error, stackTrace) {
        print(error);
        return null;
      });

      Provider.of<UserService>(context, listen: false).isSigningIn = false;
    }
  }
}

class UserAndPasswordAuth {
  Future<void> signIn(
      {BuildContext context, String email, String password}) async {
    Provider.of<UserService>(context, listen: false).userCredential =
        await _firebaseAuth
            .signInWithEmailAndPassword(
                email: email + "@gmail.com", password: password)
            .onError((error, stackTrace) {
      print(error);
      return null;
    });
  }

  Future<void> signUp(
      {BuildContext context, String email, String password}) async {
    Provider.of<UserService>(context, listen: false).userCredential =
        await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: email + "@gmail.com", password: password)
            .onError((error, stackTrace) {
      print(error);
      return null;
    });
  }
}

class FacebookAuth {
  login({BuildContext context, String email, String password}) async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(["email"]);
    Provider.of<UserService>(context, listen: false).userCredential =
        await _firebaseAuth.signInWithCustomToken(result.accessToken.token);
  }
}
