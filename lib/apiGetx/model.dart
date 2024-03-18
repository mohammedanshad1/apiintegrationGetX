// To parse this JSON data, do
//
//     final userModels = userModelsFromJson(jsonString);

import 'dart:convert';

List<UserModels> userModelsFromJson(String str) => List<UserModels>.from(json.decode(str).map((x) => UserModels.fromJson(x)));

//String userModelsToJson(List<UserModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModels {
  int  id;
  int  userId;
  DateTime  date;
 List<Product> ? products;
  int  v;

  UserModels({
   required  this.id,
    required this.userId,
    required  this.date,
   this.products,
    required this.v,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );


}

class Product {
  int ? productId;
  int ? quantity;

  Product({
     this.productId,
     this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"]??.0,
    quantity: json["quantity"]??.0,
  );

}
