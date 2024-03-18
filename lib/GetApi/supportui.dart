

import 'package:apiintegrationnew/Apinew/View/products.dart';
import 'package:apiintegrationnew/GetApi/datumui.dart';
import 'package:apiintegrationnew/GetApi/supportcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';


void main()
{
  runApp(MaterialApp(home: Supportpage(),));
}

class Supportpage extends StatelessWidget {
  Supportpage({Key? key}) : super(key: key);

  final ctrl = Get.put(SupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Support"),),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          child: GridView.builder(
            itemCount: ctrl.support.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              var data = ctrl.support.value[index];
              //var products = ctrl.name.value[index].v?.products;

              return Card(
                child: GestureDetector(
                  onTap: () {
                  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DatumUipage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                            children: [
                              Text(
                                data.url.toString() ?? "",

                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                                Text(data.text.toString() ??"")


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
