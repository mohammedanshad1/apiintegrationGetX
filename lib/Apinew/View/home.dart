

import 'package:apiintegrationnew/Apinew/View/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/usercontroller.dart';

void main(){
  runApp(MaterialApp(home: Homepage(),));
}
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ctrl = Get.put(DataController());

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
            itemCount: ctrl.name.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              var data = ctrl.name.value[index];
           //var products = ctrl.name.value[index].v?.products;
              var products=data.products;


              return Card(
                child: InkWell(
                  onTap: () {
                 // Get.to(Products22(productss: [products],));
                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Products22()));
                    if ( products!= null) {

                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Products22(  product: products!,)));
                    } else {
                      // Handle null variants
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                          children: [
                            Text(
                              data.date.toString() ?? "",

                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(data.userId.toString()),



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
