import 'package:crypto_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/bottomNavBar.dart';

class UserArea extends StatelessWidget {
  const UserArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Signed In as ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50)
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              } ,
              icon: Icon(Icons.logout),
              label: Text("Log Out", style: TextStyle(fontSize: 24),),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
