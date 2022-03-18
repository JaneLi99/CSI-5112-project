import 'package:csi5112/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shopping_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
