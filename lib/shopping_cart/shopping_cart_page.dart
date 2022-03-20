import 'package:csi5112/models/shopping_cart.dart';
import 'package:csi5112/shopping_cart/left.dart';
import 'package:csi5112/shopping_cart/right.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// const shoppingcart = Shoppingcart();

class Shoppingcart extends StatelessWidget {
  const Shoppingcart({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Cart(),
    );
  }
}

class Cart extends StatelessWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: LeftVeiw(),
          ),
          RightVeiw(),
        ],
      ),
    );
  }
}
