import 'dart:html';

import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/customer/ChatBoxCustomer.dart';
import 'package:csi5112/login/login_page.dart' as loginPage;
import 'package:csi5112/models/user.dart';
import 'package:flutter/material.dart';

import 'UserSettingRight.dart';
import 'PreviousOrders.dart';

void main() {
  runApp(CustomerMainApp());
}

class CustomerMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomerMain(),
    );
  }
}

class CustomerMain extends StatefulWidget {
  @override
  State<CustomerMain> createState() => _CustomerMainState();
}

class _CustomerMainState extends State<CustomerMain> {
  bool showPreviousOrders = true;
  bool showSettings = false;
  bool showChatbox = false;
  UserModel currentUser = loginPage.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          MerchantLeft(),
          if (showPreviousOrders) Expanded(child: CustomerOrders()),
          if (showSettings) Expanded(child: UserSettingRight()),
          if (showChatbox) Expanded(child: ChatBoxCustomer()),
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
                "Welcome, ${currentUser.userName}!",
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
                  showPreviousOrders = true;
                  showSettings = false;
                  showChatbox = false;
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.receipt),
              title: Text(
                "Previous Orders",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  // showWelcome = false;
                  showPreviousOrders = false;
                  showSettings = false;
                  showChatbox = true;
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.chat),
              title: Text(
                "Chatbox",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  // showWelcome = false;
                  showPreviousOrders = false;
                  showSettings = true;
                  showChatbox = false;
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
                    MaterialPageRoute(builder: (context) => CategoryHome()));
              },
              icon: Icon(Icons.arrow_left),
              label: Text("Back to Shopping"),
            ),
            // Spacer( ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loginPage.LoginPage()));
              },
              icon: Icon(Icons.arrow_left),
              label: Text("Sign Out"),
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
