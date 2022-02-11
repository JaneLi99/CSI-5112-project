import 'package:flutter/material.dart';
import 'Merchant_Page_Content.dart';

class Merchant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merchant Page',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 215, 221, 156),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(212, 50, 58, 65),
          title: Text('Merchant Page'),
        ),
        body: ListView(
          children: [
            CategoryList(),
            // ItemList(),
          ],
        ),
      ),
    );
  }
}
