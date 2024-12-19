
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizapp/quiz.dart';

import 'package:quizapp/sign.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = FirebaseOptions(
     apiKey: "AIzaSyAEj-WqYw8v6Y_PjSmwR5yM0Pz-raEchTo",

  authDomain: "quizapp-a5ea5.firebaseapp.com",

  projectId: "quizapp-a5ea5",

  storageBucket: "quizapp-a5ea5.firebasestorage.app",

  messagingSenderId: "595479399306",

  appId: "1:595479399306:web:26176ba9d54e9dcc631673"
);
  await Firebase.initializeApp(options: firebaseConfig);
  await Hive.initFlutter();
  var box=await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home:SignPage());
  }
}
     