import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Class/user_class.dart';
import '../widget/bottomNavBar.dart';
import 'bth.dart';
import 'eth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(context),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          readUser(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Bth()));
                }, // Handle your callback.
                borderRadius: BorderRadius.circular(16),
                child: Ink(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff7931a),
                    image: DecorationImage(
                      image: AssetImage('asset/logos/btclogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Eth()));
                }, // Handle your callback.
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff627eea),
                    image: DecorationImage(
                      image: AssetImage('asset/logos/etherlogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Compre suas Cryptos",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: () {}, // Handle your callback.
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  height: 100,
                  width: 355,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white60,
                    image: DecorationImage(
                      image: AssetImage('asset/logos/cambio_calculadora.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  readUser(){
     return FutureBuilder<UserBD?>(
      future: readUserInfo(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          final user = snapshot.data;
          return Text("Well Come ${user!.name}", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),);
        }else{
          return Text("Well Come",style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600));
        }
      },
    );
  }

  Future<UserBD?> readUserInfo() async{
    final docUser = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return UserBD.fromJson(snapshot.data()!);
    }
  }
}
