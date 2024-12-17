import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizapp/quiz.dart';
class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  State<LoginExample> createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
   TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
    late Box box;
        String _loginmassage='';

  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');

  }

  void _login(){
    setState(() {
      String storedusername=box.get('username');
      String storedpassword=box.get('password');
      if(storedusername==usernameController.text &&
      storedpassword==passwordController.text){
        _loginmassage='Login Successful';
      }
      else{
        _loginmassage='invalid Credentials';
      }
      
    });
  }
  @override

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

              TextField(
           controller: passwordController,
                decoration: InputDecoration(border: OutlineInputBorder()),),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                _login();
              }, child: Text("Login")),
              Text( _loginmassage)
            ],
          ),
        ),
      ),
      
    );
  }
}