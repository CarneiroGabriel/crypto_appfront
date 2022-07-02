import 'package:crypto_app/pages/login.dart';
import 'package:crypto_app/pages/sign_up.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin ? LoginPage(onClickedSingUp: toggle,) : SingUpPage(onClickedSingUp: toggle);
  }

  void toggle() => setState(() => isLogin = !isLogin);
}
