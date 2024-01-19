// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

import 'dart:convert';

List<Newmodel > newmodelFromJson(String str) => List<Newmodel >.from(json.decode(str).map((x) => Newmodel .fromJson(x)));

String newToJson(List<Newmodel > data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Newmodel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Newmodel ({
     this.id,
     this.title,
     this.price, this.description,
     this.category,
     this.image,
     this.rating,
  });

  factory Newmodel .fromJson(Map<String, dynamic> json) => Newmodel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
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
    required this.rate,
    required this.count,
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
