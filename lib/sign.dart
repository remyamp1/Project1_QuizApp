import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:quizapp/forgotpassword.dart';
import 'package:quizapp/login.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
 /* Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId:
              "359367635485-dmkquks85o63mnfhbmrdck41khqdrldm.apps.googleusercontent.com");
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      return await FirebaseAuth.instance.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  } */

  TextEditingController _emaliController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emaliController.text.trim(),
          password: _passwordController.text.trim());
      print("User signed up");
    } catch (e) {
      print("Sign-Up error:$e");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text("Message"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 233, 223, 250),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sign-up.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 60),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _emaliController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                )),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  _signUp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 110, 110, 109),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 109)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotpasswordPage()));
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),
        /*    SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Signin With"),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () async {
                 //   await loginWithGoogle();
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/google.jpeg"))),
                  ),
                )
              ],
            ) */
          ],
        ),
      ),
    );
  }
}