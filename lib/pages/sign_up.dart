import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Class/user_class.dart';
import '../Class/utils.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key, required this.onClickedSingUp}) : super(key: key);

  final VoidCallback onClickedSingUp;

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Image(
            image: AssetImage("asset/logos/logo.png"),
            height: 170,
          ),
          SizedBox(height: 40),
          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            icon: Icon(
              Icons.lock_open,
              size: 32,
            ),
            label: Text("Sign Up"),
            onPressed:singUp,
          ),

          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              text: "Already have account? ",
              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSingUp,
                    text: "Log in",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future singUp() async{
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
}
