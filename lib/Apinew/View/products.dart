import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Modelclass/usermodel.dart';
import '../controller/productcontrolller.dart';


class Products22 extends StatelessWidget {
 // final List<Product> productss;

  final ctrl = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        leading: Icon(Icons.arrow_back),
      ),
      body: GridView.builder(
        itemCount: ctrl.product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
             var data = ctrl.product.value[index];

          return Card(
            child: InkWell(
              onTap: () {
                // if (variants != null) {
                //   // Get.to(Variantsss(  variant: variants,));
                //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Variantsss(variant: variants)));
                // } else {
                //   // Handle null variants
                // }
              },
              child: Center(
                child: ListTile(
                  title: Text(
                    data.productId .toString()?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.black
                    ),
                  ),
                  subtitle: Text(data.quantity .toString()?? ""),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
