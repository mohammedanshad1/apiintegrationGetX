import 'package:apiintegrationnew/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/modelclass.dart';

class Geo22 extends StatelessWidget {
  final List<Geo> geo;

  Geo22({Key? key, required this.geo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geo"
        ),leading: GestureDetector(onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      },
          child: Icon(Icons.arrow_back)),
      ),
      body: GridView.builder(
        itemCount: geo.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          var geos = geo[index];
          // var variants = product.variants; // Accessing directly as it's a list

          return Card(
            child: InkWell(
              onTap: () {
                // if (variants != null) {
                // Get.to(Variantsss(  variant: variants,));
                //  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Variantsss(variant: variants)));
                // } else {
                // Handle null variants
                // }
                // },
                child:
                Center(
                  child: ListTile(
                    title: Text(
                      geos.lng ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(geos.lat ?? ""),
                  ),

                );
              },
            ),
          );
        }  ));
  }

}
