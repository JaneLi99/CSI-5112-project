import 'dart:html';

import 'package:csi5112/login/login_page.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'Dashboard.dart';

import 'UserSettingRight.dart';
=======
import 'ChatBoxMerchant.dart';
import 'Dashboard.dart';
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
  bool showSettings = false;
=======
  bool showChatbox = false;
>>>>>>> b28b353 (Frontend for Phase 2)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          MerchantLeft(),
          if (showDashboard) Expanded(child: Dashboard()),
          if (showCustomerOrders) Expanded(child: CustomerOrders()),
<<<<<<< HEAD
          if (showSettings) Expanded(child: UserSettingRight()),
=======
          if (showChatbox) Expanded(child: ChatBoxMerchant()),
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                  showSettings = false;
=======
                  showChatbox = false;
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                  showSettings = false;
=======
                  showChatbox = false;
>>>>>>> b28b353 (Frontend for Phase 2)
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
<<<<<<< HEAD
                  showSettings = true;
=======
                  showChatbox = true;
>>>>>>> b28b353 (Frontend for Phase 2)
                });
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.manage_accounts),
              title: Text(
<<<<<<< HEAD
                "Settings",
=======
                "Chatbox",
>>>>>>> b28b353 (Frontend for Phase 2)
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
