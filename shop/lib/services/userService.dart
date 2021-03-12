import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:'
final googleSignIn = GoogleSignIn();

final _firebaseAuth = FirebaseAuth.instance;

class UserService with ChangeNotifier {
  UserCredential _userCredential;
  bool _isSigningIn;
  bool _isLoggedIn;

  signOut() async {
    await googleSignIn.disconnect();
    await _firebaseAuth.signOut().then((value) => isLoggedIn = false);
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  UserCredential get userCredential => _userCredential;

  set userCredential(UserCredential userCredential) {
    _userCredential = userCredential;
    isLoggedIn = _userCredential != null;
    notifyListeners();
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  set isLoggedIn(bool x) {
    _isLoggedIn = x;
    notifyListeners();
  }
}
