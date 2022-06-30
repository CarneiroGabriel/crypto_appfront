import 'package:crypto_app/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

import '../widget/currencies_widget.dart';

ListPage(BuildContext context) => Scaffold(
  appBar: AppBar(
    title: Text("Crypto App"),
  ),
  body: Container(
    child: CurrenciesWidget(),
  ),
  bottomNavigationBar: bottomNavBar(context),
);