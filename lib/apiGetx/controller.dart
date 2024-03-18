
import 'dart:convert';


import 'package:apiintegrationnew/Apinew/Modelclass/usermodel.dart';
import 'package:apiintegrationnew/NestedApi/model/modelclass.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';


class DatassController extends GetxController {
  var modelss = <UserModels>[].obs;
  var loading = true.obs;

  getData() async {
    loading.value = true;
    String url ="https://fakestoreapi.com/carts?userId=1";
    var res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        // Check if jsonData is a list or a single object
        if (jsonData is List) {
          modelss.value = List<UserModels>.from(
            jsonData.map((x) => UserModels.fromJson(x)),
          );
        } else if (jsonData is Map<String, dynamic>) {
          // If jsonData is a single object, convert it to a list containing one object
          modelss.value = [UserModels.fromJson(jsonData)];
        }
        loading.value = false;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("$e");
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
