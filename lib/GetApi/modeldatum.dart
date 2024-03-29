
class Datum {
  int ? id;
  String  ? email;
  String ? firstName;
  String ? lastName;
  String ? avatar;

  Datum({
     this.id,
     this.email, this.firstName,
     this.lastName,
     this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0.0,
    email: json["email"]??"",
    firstName: json["first_name"]??"",
    lastName: json["last_name"]??"",
    avatar: json["avatar"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}
