import 'package:crypto_app/pages/crypto_table.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/user_wallet.dart';


bottomNavBar(BuildContext context){
  return BottomAppBar(
    //bottom navigation bar on scaffold
    color: Colors.deepPurpleAccent,
    //shape: CircularNotchedRectangle(), //shape of notch

    child: Row(
      //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          iconSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        IconButton(
          iconSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListPage(context)));
          },
        ),
        IconButton(
          iconSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.person_outline_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserArea()));
          },
        ),
      ],
    ),
  );  }