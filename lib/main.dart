import 'package:csi5112/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shopping_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // static String api = "https://localhost:7042/api";
  static String api =
      "http://csi5112project-1216580207.us-east-1.elb.amazonaws.com/api";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShoppingCartModel>(
      create: (context) => ShoppingCartModel(),
      child: const MaterialApp(
        title: 'LetsGrocery',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

// Updated by 2022-04-04 12:43pm
