


import 'dart:convert';

import 'package:apiintegrationnew/NestedApi/model/modelclass.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;




class controller extends GetxController {
  var username = <User>[].obs;
  var loading = true.obs;

  getData() async {
    loading.value = true;
    String url = "https://jsonplaceholder.typicode.com/users";
    var res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        // Check if jsonData is a list or a single object
        if (jsonData is List) {
          username.value = List<User>.from(
            jsonData.map((x) => User.fromJson(x)),
          );
        } else if (jsonData is Map<String, dynamic>) {
          // If jsonData is a single object, convert it to a list containing one object
          username.value = [User.fromJson(jsonData)];
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
