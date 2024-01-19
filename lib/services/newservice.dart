import 'package:apiintegrationnew/models/newmodels.dart';
import 'package:http/http.dart'as http;

class Newservice{

  var url="https://fakestoreapi.com/products";


  Future<List<Newmodel>?>fetchdata()async{

    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){

      return newmodelFromJson(response.body);
    }
    else{
      return null;
    }

  }

}