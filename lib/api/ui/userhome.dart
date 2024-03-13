import 'package:apiintegrationnew/api/controller/modelcontroller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context)
    => MaterialApp(useInheritedMediaQuery: true,debugShowCheckedModeBanner: false,
      home: userhome(),
    ),
  ));
}

class userhome extends StatefulWidget {

  @override
  State<userhome> createState() => _userhomeState();
}

class _userhomeState extends State<userhome> {
  var size,height,width;

  final newcontroller = Get.put(ModelController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: 
      Container(
        height: double.infinity,//half of the height size
        width: double.infinity,//half of the width size
        child: Obx(() {
          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: newcontroller.newModel.length,
              itemBuilder: (context, index) {
                final data = newcontroller!.newModel[index];

                return Card(
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(data.image.toString(),),height: 200,width: 200,

                      ),
                      Text(data.title.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                      // Text(data.id.toString()),
                      // Text(data.price.toString()),

                      Container(height: 50,width: 50,
                          decoration: BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Text(data.rating!.rate.toString(),style: TextStyle(color: Colors.white),),
                              Icon(Icons.star,color: Colors.white,size: 16,)
                            ],
                          ))

                    ],
                  ),
                );
              });
          // ListView.builder(
          //       itemCount: newcontroller.newModel.length,
          //            itemBuilder: (context, index) {
          //              final data = newcontroller!.newModel[index];
          //              return
          //                Padding(
          //                  padding: const EdgeInsets.all(8.0),     child: Container(alignment: AlignmentDirectional.centerStart,
          //                decoration: BoxDecoration(borderRadius: BorderRadius.circular(
          //                 10),color: Colors.green),
          //                  child: Column(
          //               children:<Widget> [
          //
          //                 Text(data.id.toString()),
          //                 Text(data.price.toString()),
          //                 Text(data.title.toString()),
          //
          //
          //                 Image(image: NetworkImage(data.image.toString()),fit: BoxFit.fill,),
          //                 Text(data.rating!.rate.toString()),
          //                ],
          //            ),
          //                ),
          //                );
          //           });
        }),
      ),
    );
  }
}
