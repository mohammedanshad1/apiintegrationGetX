import 'package:apiintegrationnew/models/newmodels.dart';
import 'package:apiintegrationnew/services/newservice.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Newcontroller extends GetxController {
  var newmodels = <Newmodel>[].obs;

  getdata() async {
    try {
      var data = await Newservice().fetchdata();
      if (data != null) {
        newmodels.value = data;
      }
    } catch (e) {
      Get.snackbar("title", "$e");
    }
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
