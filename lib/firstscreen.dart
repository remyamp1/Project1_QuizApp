
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';


import 'package:quizapp/sign.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    Timer(const Duration(seconds: 3),(){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>SignPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body:Center(
        child: Lottie.asset('assets/images/Animation - 1734678594256(1).json',
       // width: 250,
       // height: 250,
        fit: BoxFit.fill),
        
      ),
    );
  }
}