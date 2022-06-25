import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:mgmt/pages/home.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: Scaffold(
          //body: ShopAlloc(),
          body: LoginPage(),
        ),
      );
}
