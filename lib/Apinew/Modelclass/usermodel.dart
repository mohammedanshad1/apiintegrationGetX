// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

//String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int? id;
  int? userId;
  DateTime? date;
  List<Product>? products;
  int? v;

  UserModel({
     this.id, this.userId,
     this.date,
    this.products,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"]??.0,
    userId: json["userId"]??.0,
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "userId": userId,
  //   "date": date.toIso8601String(),
  //   "products": List<dynamic>.from(products.map((x) => x.toJson())),
  //   "__v": v,
  // };
}

class Product {
  int? productId;
  int? quantity;

  Product({
    this.productId,
     this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"]??.0,
    quantity: json["quantity"]??.0,
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
