import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shop/services/userService.dart';

final googleSignIn = GoogleSignIn();

final _firebaseAuth = FirebaseAuth.instance;

// google auto auth
class GoogleAuth {
  Future<void> login({BuildContext context}) async {
    final _userService = Provider.of<UserService>(context, listen: false);
    GoogleSignInAccount user;
    user = await googleSignIn.signIn();
    final googleAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    _userService.userCredential = await _firebaseAuth
        .signInWithCredential(credential)
        .onError((error, stackTrace) {
      return null;
    });
  }
}

// google auth
class UserAndPasswordAuth {
  Future<UserCredential> signIn(
      {BuildContext context, String email, String password}) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(
            email: email + "@gmail.com", password: password)
        .onError((error, stackTrace) {
      return null;
    });
  }

  Future<void> signUp(
      {BuildContext context, String email, String password}) async {
    final _userService = Provider.of<UserService>(context, listen: false);
    _userService.userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: email + "@gmail.com", password: password)
        .onError((error, stackTrace) async {
      return await signIn(context: context, email: email, password: password);
    });
  }
}

// face book auth
class FacebookAuth {
  login({BuildContext context, String email, String password}) async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(["email"]);
    Provider.of<UserService>(context, listen: false).userCredential =
        await _firebaseAuth.signInWithCustomToken(result.accessToken.token);
  }
}
