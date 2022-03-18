import 'package:flutter/material.dart';

class UserSettingRight extends StatefulWidget {
  @override
  _UserSettingRightState createState() => _UserSettingRightState();
}

class _UserSettingRightState extends State<UserSettingRight> {
// class UserSettingRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: 900,
              color: Colors.yellow[50],
              padding: EdgeInsets.all(16.0),
              // body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Shipping Address",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Billing Address",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Country",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Email Address",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Phone Number",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey[600]!,
                                      Colors.grey[800]!
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
