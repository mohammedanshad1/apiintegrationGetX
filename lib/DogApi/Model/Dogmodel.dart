// To parse this JSON data, do
//
//     final models = modelsFromJson(jsonString);

import 'dart:convert';

Models modelsFromJson(String str) => Models.fromJson(json.decode(str));

String modelsToJson(Models data) => json.encode(data.toJson());

class Models {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  Models({
     this.activity,
    this.type,
     this.participants,
    this.price,
     this.link,
    this.key,
    this.accessibility,
  });

  factory Models.fromJson(Map<String, dynamic> json) => Models(
    activity: json["activity"]??"",
    type: json["type"]??"",
    participants: json["participants"]??0,
    price: json["price"]?.toDouble()??0.0,
    link: json["link"]??"",
    key: json["key"]??"",
    accessibility: json["accessibility"]?.toDouble()??0.0,
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
    "accessibility": accessibility,
  };
}
