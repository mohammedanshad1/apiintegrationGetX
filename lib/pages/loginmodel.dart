class Loginresponsemodel{

final String token;
final String error;

Loginresponsemodel({required this.token,required this.error});
factory Loginresponsemodel.fromJson(Map<String,dynamic>json){


  return Loginresponsemodel(token: json["token"]!=null? json["token"]:"", error:json["error"]!=null ? json["error"] :"");
}

}
class Loginrequestmodel{


  String email;
  String password;
  Loginrequestmodel({required this.email, required this.password});

  Map<String,dynamic> toJson(){


    Map<String,dynamic>map={

      "email":email.trim(),
      "password":password.trim()
    };

    return map;
  }
}