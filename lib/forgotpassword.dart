import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotpasswordPage extends StatefulWidget {
  const ForgotpasswordPage({super.key});

  @override
  State<ForgotpasswordPage> createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  final TextEditingController _emaliController = TextEditingController();
  bool _isLoading = false;
  String? _errormessage;

  Future<void> _sendPasswordResetEmail() async {
    setState(() {
      _isLoading = true;
      _errormessage = null;
    });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emaliController.text.trim());
      setState(() {
        _isLoading = false;
      });
      _showDialog("password reset email sent! please check your inbox.");
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showDialog(e.message ?? "An error occurred");
    }
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Notification"),
              content: Text(message),
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
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _emaliController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Enter your email",
              hintText: "example@example.com",
              errorText: _errormessage,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _sendPasswordResetEmail,
                  child: Text("Reset Password"))
        ],
      ),
    );
  }
}