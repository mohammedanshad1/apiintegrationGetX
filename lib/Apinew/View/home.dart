import 'package:apiintegrationnew/api/controller/modelcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/usercontroller.dart';
void main(){


  runApp(MaterialApp(home: home(),));
}
class home extends StatefulWidget{

  @override
  State<home> createState() => _userhomeState();
}

class _userhomeState extends State<home> {
  final newcontroller=Get.put(UserModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Api Getx"),),

      body: Container(height: double.infinity,
        width: double.infinity,
        child: Obx((){


          return
            ListView.builder(
                itemCount: newcontroller.userModel.length,
                itemBuilder: (context, index) {
                  final data = newcontroller!.userModel[index];
                  return
                    Padding(
                      padding: const EdgeInsets.all(8.0),     child: Container(alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                          10),color: Colors.green),
                      child: Column(
                        children:<Widget> [

                          Text(data.id.toString()),
                          Text(data.userId.toString()),
                          Text(data.date.toString()),

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