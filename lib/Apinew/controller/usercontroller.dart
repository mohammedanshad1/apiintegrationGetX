//import 'package:apiintegrationnew/api/model/model.dart';
//import 'package:apiintegrationnew/api/service/httpservicenew.dart';
import 'package:get/get.dart';
import 'package:apiintegrationnew/Apinew/Service/httpservice.dart';
import '../Modelclass/usermodel.dart';

class UserModelController extends GetxController {
  var userModel = <UserModel>[].obs;

  void fetchDatas() async {
    print('fetchData called');
    try {
      var datas = await userservice.getdata();
      print('data fetched: $datas');
      if (datas != null) {
        userModel.assignAll(datas);
        print('newModel length: ${userModel.length}');
      } else {
        print('data is null or empty');
      }
    } catch (e) {
      print('Error fetching data: $e');
      Get.snackbar("Error", "$e");
    }
  }



  @override
  void onInit() {
    fetchDatas();
    super.onInit();
  }
}
