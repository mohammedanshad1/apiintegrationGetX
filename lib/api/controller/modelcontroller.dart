import 'package:apiintegrationnew/api/model/model.dart';
import 'package:apiintegrationnew/api/service/httpservicenew.dart';
import 'package:get/get.dart';

class Modelcontroller extends GetxController{


  var newmodel = <Model>[].obs;
  heredata()async{


    try {
      var data = await dataservice.getdata();
      if (data != null) {
        newmodel.value = data;
      }
    } catch (e) {
     Get.snackbar("id"," $e");
    }
    
  }


  @override
  void onInit() {
    heredata();
    super.onInit();
  }
}