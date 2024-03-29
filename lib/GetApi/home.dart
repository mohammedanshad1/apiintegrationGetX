

import 'package:apiintegrationnew/Apinew/View/products.dart';
import 'package:apiintegrationnew/GetApi/datumui.dart';
import 'package:apiintegrationnew/GetApi/supportui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';




void main(){
  runApp(MaterialApp(home: Homepage(),));
}
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ctrl = Get.put(DatasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MERCHANT NAMES"),),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          child: GridView.builder(
            itemCount: ctrl.models.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              var data = ctrl.models.value[index];
              //var products = ctrl.name.value[index].v?.products;

              return Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DatumUipage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                          children: [
                            Text(
                              data.total.toString() ?? "",

                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),


                          ],
                        )),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
