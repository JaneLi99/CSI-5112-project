import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
/*  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LetsGrocery',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
