// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  int? id;
   String? title;
  int? price;String? description;
  String? category;
  String? image;
  Rating? rating;

  Model({
     this.id,
     this.title,
   this.price, this.description,
    this.category,
   this.image,
    this.rating,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"] as int,
    title: json["title"] as String? ,
    price: json["price"]?.toDouble(),
    description: json["description"] as String?,
    category: json["category"] as String? ,
    image: json["image"] as String? ,
    rating: Rating.fromJson(json["rating"]) as Rating?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };
}

class Rating {
  double? rate;
  int? count;

  Rating({
   this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
