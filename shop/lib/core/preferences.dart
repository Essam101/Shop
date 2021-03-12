import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/models/prefModel.dart';

class Preferences with PrefModel {
  setPreferences({key, val, type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type is String) {
      prefs.setString(key, val);
    } else if (type is int) {
      prefs.setInt(key, val);
    } else if (type is bool) {
      prefs.setBool(key, val);
    } else if (type is double) {
      prefs.setDouble(key, val);
    }
  }

  getPreferences({key, type}) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type is String) {
      value = prefs.getString(key);
    } else if (type is int) {
      value = prefs.getInt(key);
    } else if (type is bool) {
      value = prefs.getBool(key);
    } else if (type is double) {
      value = prefs.getDouble(key);
    }
    return value;
  }

  deleteAllPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  deletePreference({key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

extension Preferencestest on dynamic {
  setPreferences({key, val, type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type is String) {
      prefs.setString(key, val);
    } else if (type is int) {
      prefs.setInt(key, val);
    } else if (type is bool) {
      prefs.setBool(key, val);
    } else if (type is double) {
      prefs.setDouble(key, val);
    }
  }

  getPreferences({key, type}) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type is String) {
      value = prefs.getString(key);
    } else if (type is int) {
      value = prefs.getInt(key);
    } else if (type is bool) {
      value = prefs.getBool(key);
    } else if (type is double) {
      value = prefs.getDouble(key);
    }
    return value;
  }

  deleteAllPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  deletePreference({key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

class safas {
  fun() {
    String xx = "";
    xx.setPreferences(val: this, key: "fasd", type: String);
  }
}
