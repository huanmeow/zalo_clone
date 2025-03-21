import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Account/email.dart';
import 'Screen/home_welcome.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(

      MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
