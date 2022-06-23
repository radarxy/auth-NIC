import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:mgmt/pages/home.dart';

const primaryColor = Color(0xFF4a4e69);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Allocation',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: ShopAlloc(),
      body: LoginPage(),
    );
  }
}
