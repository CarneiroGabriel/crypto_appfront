import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          SizedBox(height: 20,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50)
            ),
            icon: Icon(Icons.lock_open, size: 32,),
            label: Text("Sing In"),
            onPressed: singIn,
          ),
        ],
      ),
    );
  }

  Future singIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
