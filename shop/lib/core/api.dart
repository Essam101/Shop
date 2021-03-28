import 'package:shop/core/preferences.dart';
import 'package:shop/models/PublicModel.dart';
import 'package:shop/models/prefModel.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Api {
  Preferences _preferences = new Preferences();
  PublicModel publicModel;

  Future<PublicModel> get({url}) async {
    var _url = await getBaseUrl() + url;
    http.Response response;
    response = await http.get(Uri.parse(_url));
    publicModel = publicModelFromJson(response.body);
    return publicModel;
  }

  Future<PublicModel> post({url}) async {
    var _url = await getBaseUrl() + url;
    http.Response response;
    response = await http.post(Uri.parse(_url));
    publicModel = publicModelFromJson(response.body);
    return publicModel;
  }

  Future<PublicModel> put({url, body}) async {
    var _url = await getBaseUrl() + url;
    http.Response response;
    response = await http.put(Uri.parse(_url), body: body);
    publicModel = publicModelFromJson(response.body);
    return publicModel;
  }

  Future<PublicModel> delete({url, body}) async {
    var _url = await getBaseUrl() + url;
    http.Response response;
    response = await http.delete(Uri.parse(_url), body: body);
    publicModel = publicModelFromJson(response.body);
    return publicModel;
  }

  Future<Map<String, String>> getHeader() async {
    return {"fas": "fas"};
  }

  Future<String> getBaseUrl() async {
    return await _preferences.getPreferences(
            type: "", key: PrefModel.baseUrl) ??
        "";
  }
}
