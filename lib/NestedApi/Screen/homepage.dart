import 'package:apiintegrationnew/NestedApi/Screen/detailspage.dart';
import 'package:apiintegrationnew/api/ui/userhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';


void main(){

  runApp(MaterialApp(home: Homepage(),));
}
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ctrl = Get.put(controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("USERS"),
     ),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          child: GridView.builder(
            itemCount: ctrl.username.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              var data = ctrl.username.value[index];
              var geos = ctrl.username.value[index].address?.geo;
              return Card(
                child: GestureDetector(
                  onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Geo22(geo:[geos!])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                          children: [
                            Text(
                              data.username ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(data.email ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            Text(data.company.name ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            Text(data.phone ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            Text(data.website ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            Text(data.address.city),
                            Text(data.address.street),
                            Text(data.company.catchPhrase ?? "")
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
