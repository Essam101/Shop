// To parse this JSON data, do
//
//     final storeProfileModel = storeProfileModelFromJson(jsonString);

import 'dart:convert';

StoreProfileModel storeProfileModelFromJson(String str) =>
    StoreProfileModel.fromJson(json.decode(str));

String storeProfileModelToJson(StoreProfileModel data) =>
    json.encode(data.toJson());

class StoreProfileModel {
  StoreProfileModel({
    this.storeName,
    this.storeDetails,
    this.numbersOfUsers,
    this.image,
    this.userId,
    this.workActivity,
    this.currency,
  });

  String storeName;
  String storeDetails;
  String numbersOfUsers;
  String image;
  String userId;
  String workActivity;
  String currency;

  factory StoreProfileModel.fromJson(Map<String, dynamic> json) =>
      StoreProfileModel(
        storeName: json["storeName"],
        storeDetails: json["storeDetails"],
        numbersOfUsers: json["numbersOfUsers"],
        image: json["image"],
        userId: json["userId"],
        workActivity: json["workActivity"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "storeName": storeName,
        "storeDetails": storeDetails,
        "numbersOfUsers": numbersOfUsers,
        "image": image,
        "userId": userId,
        "workActivity": workActivity,
        "currency": currency,
      };
}
