
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:apiintegrationnew/pages/loginmodel.dart';

class Apiservice{

  Future<Loginresponsemodel>login(Loginrequestmodel requestmodel) async{

     String url = "https://reqres.in/api/login";

     final response= await http.post(url as Uri,body:requestmodel.toJson());
     if(response.statusCode == 200 || response.statusCode ==400){

       return Loginresponsemodel.fromJson(jsonDecode(response.body));
     }
       else{

         throw Exception("Failed to load data");
     }
  }

}