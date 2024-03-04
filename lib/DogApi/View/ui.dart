import 'package:apiintegrationnew/api/controller/modelcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Getx.dart';

void main() {
  runApp(MaterialApp(
    home: userhome(),
  ));
}

class userhome extends StatefulWidget {
  @override
  State<userhome> createState() => _userhomeState();
}

class _userhomeState extends State<userhome> {
  final newcontroller = Get.put(ModelsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Api"),
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {

          return

            ListView.builder(
                itemCount: newcontroller.newModel.length,
                itemBuilder: (context, index) {
                  final data = newcontroller!.newModel[index];
                  return
                    Padding(
                      padding: const EdgeInsets.all(8.0),     child: Container(alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                          10),color: Colors.green),
                      child: Column(
                        children:<Widget> [

                          Text(data.price.toString()),
                          Text(data.participants.toString()),
                          Text(data.activity.toString()),
                          Text(data.accessibility.toString()),
                          Text(data.link.toString())


                        ],
                      ),
                    ),
                    );
                });
        }),
      ),
    );
  }
}
