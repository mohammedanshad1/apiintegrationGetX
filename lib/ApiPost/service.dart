import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiService{
  static Future<void> getUser(BuildContext context,
      String name,
      String job,
    ) async{

    try{
      var data={
        "name": name,
        "job": job,

      };
      print(data);
      final urls = "https://reqres.in/api/users";
      print(urls);
      var response = await http.post(Uri.parse(urls),body: data);
      var body = json.decode(response.body);
      print(body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Created Successfully !'),

            ));
        //Navigator.pushNamed(context, RouteName.login);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }
    catch(e){
      throw e.toString();
    }
  }
}