import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Class/user_class.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({Key? key}) : super(key: key);

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {

  final userLogin = FirebaseAuth.instance.currentUser;
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Age"),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(onPressed: (){
              final user = UserBD(
                name: nameController.text,
                age: int.parse(ageController.text),);

                createUser(user);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserArea()));

            }, child: Icon(Icons.add))
          ],
        ),
      ),

    );
  }
  void createUser(UserBD user){
    //reference the document
    final docUser = FirebaseFirestore.instance.collection("users").doc(userLogin!.uid);
    user.id = docUser.id;

    final json = user.toJson();

    //create doc and write on firebase
    docUser.set(json);
  }
}
