import 'package:crypto_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/bottomNavBar.dart';
import 'edit_user_page.dart';
import 'extra_info.dart';

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
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              icon: Icon(Icons.logout),
              label: Text(
                "Log Out",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40), primary: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text("Delete Account"),
                        content: Text("Are you sure to Delete your Account ?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff00d7f3),
                            ),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.currentUser!.delete();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text("Delete Account"),
                          )
                        ],
                      ),
                );
              },
              icon: Icon(Icons.delete_outline),
              label: Text(
                "Delete Account",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40), primary: Colors.amber),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditUserPage()));
              },
              icon: Icon(Icons.manage_accounts),
              label: Text(
                "Edit your account",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40), primary: Colors.green),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExtraInfo()));
              },
              icon: Icon(Icons.info_outline),
              label: Text(
                "put extra infos",
                style: TextStyle(fontSize: 20),
              ),
            ),
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
