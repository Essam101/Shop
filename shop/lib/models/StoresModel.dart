// To parse this JSON data, do
//
//     final storesModel = storesModelFromJson(jsonString);

import 'dart:convert';

List<StoresModel> storesModelFromJson(String str) => List<StoresModel>.from(json.decode(str).map((x) => StoresModel.fromJson(x)));

StoresModel storeModelFromJson(String str) => StoresModel.fromJson(json.decode(str));
class StoresModel {
  StoresModel({
    this.storeId,
    this.userId,
    this.storeName,
    this.storeDetails,
    this.numbersOfUsers,
    this.image,
    this.workActivity,
    this.currency,
    this.creationDate,
  });

  int storeId;
  String userId;
  String storeName;
  String storeDetails;
  int numbersOfUsers;
  String image;
  String workActivity;
  String currency;
  DateTime creationDate;

  factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
    storeId: json["storeId"],
    userId: json["userId"],
    storeName: json["storeName"],
    storeDetails: json["storeDetails"],
    numbersOfUsers: json["numbersOfUsers"],
    image: json["image"],
    workActivity: json["workActivity"],
    currency: json["currency"],
    creationDate: DateTime.parse(json["creationDate"]),
  );

  Map<String, dynamic> toJson() => {
    "storeId": storeId,
    "userId": userId,
    "storeName": storeName,
    "storeDetails": storeDetails,
    "numbersOfUsers": numbersOfUsers,
    "image": image,
    "workActivity": workActivity,
    "currency": currency,
    "creationDate": creationDate.toIso8601String(),
  };
}















