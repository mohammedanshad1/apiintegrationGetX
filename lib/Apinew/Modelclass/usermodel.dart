// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  int userId;
  DateTime date;
  int v;

  UserModel({
    required this.id,
    required this.userId,
    required this.date,
   // required this.products,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
  //  products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date.toIso8601String(),
   // "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "__v": v,
  };
}
