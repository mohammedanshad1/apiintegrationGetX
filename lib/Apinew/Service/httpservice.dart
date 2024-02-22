
import 'package:http/http.dart'as http;

import '../Modelclass/usermodel.dart';

class userservice{



  // var urls="https://fakestoreapi.com/products?limit=5";

  static Future<List<UserModel>?>getdata() async{

    var responses=await http.get(Uri.parse("https://fakestoreapi.com/carts?userId=1"));
    if(responses.statusCode==200){
      var data = responses.body;
      return userModelFromJson(data);
    }
    else{
      throw Exception();
    }

  }
}