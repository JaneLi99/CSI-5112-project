import 'package:flutter/material.dart';

import 'details_screen.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product',
      home: Details_Screen(),
    );
  }
}
