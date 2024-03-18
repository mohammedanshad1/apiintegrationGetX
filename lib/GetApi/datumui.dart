

import 'package:apiintegrationnew/Apinew/View/products.dart';
import 'package:apiintegrationnew/GetApi/datumcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';



//
// void main(){
//   runApp(MaterialApp(home: Homepage(),));
// }
class DatumUipage extends StatelessWidget {
  DatumUipage({Key? key}) : super(key: key);

  final ctrl = Get.put(DatumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"),),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : GestureDetector(onTap: (){

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DatumUipage()));
        },
              child: Container(
                        child: ListView.builder(
              itemCount: ctrl.datum.length, itemBuilder: (BuildContext context, int index) {
                        var data=ctrl.datum.value[index];
                        return  ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                      data.avatar ??""),
                  backgroundColor: Colors.white,
                ),
                title: Text(data.firstName ?? ""),

                subtitle:  Text(data.lastName ??""),
              );
                        },
                        ),

                    ),
            );
          },



          ),
        );
      }

  }

