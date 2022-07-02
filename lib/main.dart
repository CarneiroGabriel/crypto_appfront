import 'package:crypto_app/Class/utils.dart';
import 'package:crypto_app/currency_provider.dart';
import 'package:crypto_app/pages/auth.dart';
import 'package:crypto_app/pages/home.dart';
import 'package:crypto_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  static final String title = 'Crypto App';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => CurrencyProvider(),
    child: MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: MyApp.title,
      theme: ThemeData.dark(),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState!){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text('Something has error'),);
          }else if(snapshot.hasData){
            return HomePage();
          }else{
            return AuthPage();
          }
        }
      ),
    );
  }
}




