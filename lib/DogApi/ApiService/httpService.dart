
import 'package:http/http.dart'as http;

import '../Model/Dogmodel.dart';

class Modelsservice{



  // var urls="https://fakestoreapi.com/products?limit=5";

  static Future<List<Models>?>getdata() async{

    var responses=await http.get(Uri.parse("https://www.boredapi.com/api/activity?type=recreational"));
    if(responses.statusCode==200){
      var data = responses.body;
      return modelsFromJson(data);
    }
    else{
      throw Exception();
    }

  }
}