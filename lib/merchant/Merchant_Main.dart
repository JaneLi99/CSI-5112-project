import 'dart:html';

import 'package:csi5112/login/login_page.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';

import 'UserSettingRight.dart';
import 'CustomerOrders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MerchantMain(),
    );
  }
}

class MerchantMain extends StatefulWidget {
  @override
  State<MerchantMain> createState() => _MerchantMainState();
}

class _MerchantMainState extends State<MerchantMain> {
  // bool showWelcome = ;
  bool showDashboard = true;
  bool showCustomerOrders = false;
  bool showSettings = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          MerchantLeft(),
          if (showDashboard) Expanded(child: Dashboard()),
          if (showCustomerOrders) Expanded(child: CustomerOrders()),
          if (showSettings) Expanded(child: UserSettingRight()),
        ],
      ),
    );
  }

  Widget MerchantLeft() {
    return Drawer(
      elevation: 0,
      child: Container(
        // width: 200,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Merchant Home",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  // showWelcome = false;
                  showDashboard = true;
                  showCustomerOrders = false;
                  showSettings = false;
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.dashboard),
              title: Text(
                "Dashboard",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  // showWelcome = false;
                  showDashboard = false;
                  showCustomerOrders = true;
                  showSettings = false;
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.receipt),
              title: Text(
                "Customer Orders",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  // showWelcome = false;
                  showDashboard = false;
                  showCustomerOrders = false;
                  showSettings = true;
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.manage_accounts),
              title: Text(
                "Settings",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.arrow_left),
              label: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }

  Widget Settings() {
    return Text("Settings");
  }
}
