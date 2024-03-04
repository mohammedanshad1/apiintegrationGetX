

import 'package:apiintegrationnew/ApiPost/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Postmethod(),
  ));
}

class Postmethod extends StatefulWidget {
  @override
  State<Postmethod> createState() => _PostmethodState();
}

class _PostmethodState extends State<Postmethod> {


  TextEditingController nameController=TextEditingController();
  TextEditingController jobController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Name Here"),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Password Here"),
                controller: jobController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async{
                   ApiService.getUser(context,
                        nameController.text.trim(),
                        jobController.text.trim(),
                       );
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
