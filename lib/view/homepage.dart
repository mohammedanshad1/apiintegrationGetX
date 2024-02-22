import 'package:apiintegrationnew/controller/newcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
void main(){

  runApp(MaterialApp(home: HomePage(),));
}
class HomePage extends StatelessWidget {
  final controller = Get.put(Newcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Api"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          return ListView.builder(
              itemCount: controller.newmodels.length,
              itemBuilder: (context, index) {
                final data = controller.newmodels[index];
                return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                        10),color: Colors.green),
                      child: Column(
                      children: [
                        Text(data.id.toString()),
                        Text(data.price.toString()),
                        Text(data.title.toString()),
                        Text(data.rating.toString())

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
