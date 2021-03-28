// To parse this JSON data, do
//
//     final publicModel = publicModelFromJson(jsonString);

import 'dart:convert';

PublicModel publicModelFromJson(String str) => PublicModel.fromJson(json.decode(str));

String publicModelToJson(PublicModel data) => json.encode(data.toJson());

class PublicModel {
  PublicModel({
    this.isValid,
    this.model,
    this.messages,
  });

  bool isValid;
  dynamic model;
  String messages;

  factory PublicModel.fromJson(Map<String, dynamic> json) => PublicModel(
    isValid: json["isValid"],
    model: json["model"],
    messages: json["messages"],
  );

  Map<String, dynamic> toJson() => {
    "isValid": isValid,
    "model": model,
    "messages": messages,
  };
}
