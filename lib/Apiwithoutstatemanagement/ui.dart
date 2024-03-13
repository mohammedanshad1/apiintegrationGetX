import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'models.dart';





void main(){


  runApp(MaterialApp(home: home20(),));
}
class home20 extends StatefulWidget{
  @override
  State<home20> createState() => _home20State();
}

class _home20State extends State<home20> {
  User Data=User(support: [],data: []);
  bool isLoading=true;

  void fetchdata() async{

    var response=await http.get(Uri.parse("https://reqres.in/api/users/2"));
    var json=jsonDecode(response.body);
    setState(() {
      Data= User.fromJson(json);
      isLoading=false;

    });

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API"),),

      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){

            return
              Column(children: [


                Container(

                    child: Image(image: NetworkImage(Data.data![index].avatar!),)),

                Container(
                  child: Text(Data.data![index].firstName!),),
                SizedBox(height: 10,),

                Container(
                  child: Text(Data.data![index].lastName!),),


                SizedBox(height: 10,),
                Container(

                  child: Text(Data.data![index].email!),),
                SizedBox(height: 10,),

              ],
              );
          },itemCount: Data.data!.length),
      ),
    );
  }
}