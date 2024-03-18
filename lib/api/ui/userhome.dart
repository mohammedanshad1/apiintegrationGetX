

import 'package:apiintegrationnew/Apinew/View/products.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/modelcontroller.dart';


void main(){
  runApp(DevicePreview(
      builder: (BuildContext context)
      =>MaterialApp(home: Homepage(),useInheritedMediaQuery: true,debugShowCheckedModeBanner: false,)));
}
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ctrl = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),


      backgroundColor: Colors.green,

      ),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          child: GridView.builder(
            itemCount: ctrl.model.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,

            ),
            itemBuilder: (context, index) {
              var data = ctrl.model.value[index];


              return Card(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                          children: [
                            Image(image: NetworkImage(data.image.toString()),height: 100,width: 100,),
                            Text(
                              data.title.toString() ?? "",

                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(data.description.toString()),

                            SizedBox(height: 50,width: 50,
                              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                              color: Colors.blue),
                                  child: Row(
                                    children: [
                                      Text(data.rating!.rate!.toString()),
                                      Icon(Icons.star,color: Colors.white,)
                                    ],
                                  )),
                            ),
                            Text(data.price.toString()),



                          ],
                        )),
                  ),

              );
            },
          ),
        );
      }),
    );
  }
}
