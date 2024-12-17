import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizapp/login.dart';

class RegistrationExample extends StatefulWidget {
  const RegistrationExample({super.key});

  @override
  State<RegistrationExample> createState() => _RegistrationExampleState();
}

class _RegistrationExampleState extends State<RegistrationExample> {
 TextEditingController usernameController=TextEditingController();
TextEditingController passwordController=TextEditingController();
  late Box box;
  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 202, 248),
      body: 
      Center(
         child: Padding(
          padding: const EdgeInsets.all(20.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 170),
              Text("Username",
              style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
              SizedBox(height: 13),
           
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                       controller: usernameController,
                  decoration: InputDecoration(border: OutlineInputBorder(),),),
              ),
              SizedBox(height: 20),
           
              Text("Password",style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
              SizedBox(height: 10),
           
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(border: OutlineInputBorder()),),
              ),
              SizedBox(height: 60),
              ElevatedButton(onPressed: (){
           
                setState(() {
                  box.put('username', usernameController.text);
                  box.put('password',passwordController.text);
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginExample()));
              }, child: Text("Registration"))
            ],
                     ),
        ),
      ),
    );
  }
}