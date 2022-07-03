import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/Class/coins.dart';
import 'package:crypto_app/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Eth extends StatefulWidget {
  const Eth({Key? key}) : super(key: key);

  @override
  State<Eth> createState() => _EthState();
}

class _EthState extends State<Eth> {
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
            final eth = snapshot.data!;
            return ListView(
              children: eth.map(buildCoin).toList(),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  Widget buildCoin(Coins eth) => ListTile(
    leading: CircleAvatar(child: Image.asset("asset/logos/etherlogo.png"),),
    title: Text("R\$${eth.price.toString()}"),
    subtitle: Text(eth.when.toIso8601String()),
  );

  Stream<List<Coins>> readCoins() => FirebaseFirestore.instance.collection("ETH").snapshots().map((snapshot) => snapshot.docs.map((doc) => Coins.fromJson(doc.data())).toList());
}
