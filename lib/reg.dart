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
      body: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Username"),
              SizedBox(height: 10),

              TextField(
       controller: usernameController,
                decoration: InputDecoration(border: OutlineInputBorder(),),),
              SizedBox(height: 20),

              Text("Password"),
              SizedBox(height: 10),

              TextField
              
              (
                controller: passwordController,
                decoration: InputDecoration(border: OutlineInputBorder()),),
              SizedBox(height: 30),
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