import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/Class/coins.dart';
import 'package:crypto_app/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Bth extends StatefulWidget {
  const Bth({Key? key}) : super(key: key);

  @override
  State<Bth> createState() => _BthState();
}

class _BthState extends State<Bth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      bottomNavigationBar: bottomNavBar(context),
      body: StreamBuilder<List<Coins>>(
            stream: readCoins(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text("Something went wrong!");
              }else if(snapshot.hasData){
                final btc = snapshot.data!;
                return ListView(
                  children: btc.map(buildCoin).toList(),
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
    );
  }

  Widget buildCoin(Coins btc) => ListTile(
    leading: CircleAvatar(child: Image.asset("asset/logos/btclogo.png"),),
    title: Text("R\$${btc.price.toString()}"),
    subtitle: Text(btc.when.toIso8601String()),
  );

  Stream<List<Coins>> readCoins() => FirebaseFirestore.instance.collection("BTC").snapshots().map((snapshot) => snapshot.docs.map((doc) => Coins.fromJson(doc.data())).toList());
}
