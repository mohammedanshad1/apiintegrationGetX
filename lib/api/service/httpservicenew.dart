import '../model/model.dart';
import 'package:http/http.dart'as http;

class dataservice{



 // var urls="https://fakestoreapi.com/products?limit=5";

 static Future<List<Model>?>getdata() async{

    var responses=await http.get(Uri.parse("https://fakestoreapi.com/products?limit=5"));
    if(responses.statusCode==200){
      var data = responses.body;
      return modelFromJson(data);
    }
    else{
      throw Exception();
    }

  }
}