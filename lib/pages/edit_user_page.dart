import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Class/utils.dart';
import '../main.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
              height: 30,
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
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              icon: Icon(
                Icons.edit,
                size: 32,
              ),
              label: Text("Change User Data"),
              onPressed: (){
                try {
                  FirebaseAuth.instance.currentUser?.updateEmail(emailController.text.trim());
                  FirebaseAuth.instance.currentUser?.updatePassword(passwordController.text.trim());
                } on FirebaseAuthException catch (e) {
                  print(e);
                  Utils.showSnackBar(e.message);
                }


                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
