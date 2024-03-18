// To parse this JSON data, do
//
//     final models = modelsFromJson(jsonString);

import 'dart:convert';

Models modelsFromJson(String str) => Models.fromJson(json.decode(str));

//String modelsToJson(Models data) => json.encode(data.toJson());

class Models {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;



  Models({
     this.page,
     this.perPage,
  this.total,
  this.totalPages,


  });

  factory Models.fromJson(Map<String, dynamic> json) => Models(
    page: json["page"]??.0,
    perPage: json["per_page"]??.0,
    total: json["total"]??.0,
    totalPages: json["total_pages"]??.0,


  );

  // Map<String, dynamic> toJson() => {
  //   "page": page,
  //   "per_page": perPage,
  //   "total": total,
  //   "total_pages": totalPages,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //   "support": support.toJson(),
  // };
}
