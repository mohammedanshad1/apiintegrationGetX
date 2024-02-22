import 'dart:html';

import 'package:apiintegrationnew/pages/loginmodel.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){


  runApp(DevicePreview(builder: (BuildContext context)
  => MaterialApp(home: loginnew(),useInheritedMediaQuery: true,debugShowCheckedModeBanner: false,)));
}
class loginnew extends StatefulWidget{
  @override
  State<loginnew> createState() => _loginnewState();
}

class _loginnewState extends State<loginnew> {
  GlobalKey<FormState>formkey=GlobalKey();
  bool showpass=true;

  late Loginrequestmodel requestmodel;


  @override
  void initState() {
    requestmodel=Loginrequestmodel(email: "",password: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:  AppBar(title: Text("Login Page"),leading: Icon(Icons.menu),),

        body:SingleChildScrollView(
          child:Form(
            key:formkey,
            child: Column(children: [

              // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image:
              // AssetImage("assets/icons/WhatsApp Image 2024-01-01 at 20.20.23_1c9df424.jpg"),),
              // ),
              // ),

              Center(child: Text("Login Here",style: TextStyle(color: Colors.red,fontSize: 30),)),
              SizedBox(
                height: 20,
              ),
              TextFormField(decoration: InputDecoration(hintText: "Email/username",prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                  validator: (input){
                    if(input!.isEmpty || input.contains("#")|| input.contains("/")){
                      return "Enter valid email";
                    }
                    else{
                      return null;
                    }
                  },onSaved: (input)=> requestmodel.email=input!,
              ),
              SizedBox(height: 20),
              TextFormField(obscureText: showpass,obscuringCharacter: "*",
                  decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.password),suffixIcon:
                  IconButton(onPressed: (){
                    setState(() {
                      if(showpass){
                        showpass=false;
                      }
                      else{
                        showpass=true;
                      }
                    });
                  },icon: Icon(showpass==true?Icons.visibility_off:Icons.visibility),),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                  validator: (input){
                    if(input!.isEmpty || input.length<6|| input.contains("/")){
                      return "Enter valid passsword";
                    }
                    else{
                      return null;
                    }
                  },
              onSaved: (input)=>requestmodel.password = input!,),
              SizedBox(height: 20),Container(
                  child: TextButton(onPressed: (){},
                      child: Text("ALready have an account",style: TextStyle(color: Colors.blue,fontSize: 15),))),

              SizedBox(height: 20),Container(
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: BorderSide(width: 1.5)),
                  onPressed: (){
                    final valid=formkey.currentState!.validate();
                    if(valid){
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>(),));

                      print(requestmodel.toJson());

                    }
                  }, child: Text("Login"),
                ),
              )

            ],),
          ),



        ) );
  }


}