import 'package:apiintegrationnew/DogApi/Model/Dogmodel.dart';
import 'package:apiintegrationnew/api/model/model.dart';
import 'package:apiintegrationnew/DogApi/ApiService/httpService.dart';
import 'package:get/get.dart';

class ModelsController extends GetxController {
  var newModel = <Models>[].obs;

  void fetchData() async {
    print('fetchData called');
    try {
      var data = await Modelsservice.getdata();
      print('data fetched: $data');
      if (data != null) {
        newModel.assignAll(data);
        print('newModel length: ${newModel.length}');
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
    fetchData();
    super.onInit();
  }
}
