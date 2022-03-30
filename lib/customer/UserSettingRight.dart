import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/httprequest/delete_data.dart';
import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/httprequest/put_data.dart';
import 'package:csi5112/login/login_page.dart' as loginPage;
import 'package:csi5112/models/product.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter/foundation.dart';
import '../main.dart';
import 'package:csi5112/httprequest/get_data.dart';

class UserSettingRight extends StatefulWidget {
  @override
  _UserSettingRightState createState() => _UserSettingRightState();
}

class _UserSettingRightState extends State<UserSettingRight> {
  TextEditingController updateUserName = TextEditingController();
  TextEditingController updatePhoneNumber = TextEditingController();
  TextEditingController updateAddress = TextEditingController();
  TextEditingController updateEmail = TextEditingController();
  TextEditingController updatePassword = TextEditingController();

  // late Future<List<UserModel>> userList;
  List<UserModel> localUserList = [];

  UserModel user = loginPage.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel updatedUser = user;

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
                    "Change Information",
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
                          controller: updateUserName,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "User Name: ${user.userName}",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: updatePassword,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Password: ${user.password}",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: updatePhoneNumber,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Phone Number: ${user.phoneNumber}",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: updateAddress,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Address: ${user.address}",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (updateUserName.text != "") {
                                  print(updateUserName.text);
                                  updatedUser.userName = updateUserName.text;
                                  // updatedUser.userName = "9";
                                }
                                if (updatePassword.text != "") {
                                  print(updatePassword.text);
                                  updatedUser.password = updatePassword.text;
                                  // updatedUser.password = "99";
                                }
                                if (updatePhoneNumber.text != "") {
                                  print(
                                      "phonenumber: " + updatePhoneNumber.text);
                                  updatedUser.phoneNumber =
                                      updatePhoneNumber.text;
                                  // updatedUser.phoneNumber = "999";
                                }

                                if (updateAddress.text != "") {
                                  print(updateAddress.text);
                                  updatedUser.address = updateAddress.text;
                                  // updatedUser.address = "9999";
                                }
                                print(updatedUser.toString());
                                HttpPut.updateUserData(updatedUser);
                                updateUserName.text = "";
                                updatePassword.text = "";
                                updatePhoneNumber.text = "";
                                updateAddress.text = "";
                                showUpdateSuccessAlert(context);
                              });
                            },
                            child: Text("Submit"))
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

  showUpdateSuccessAlert(BuildContext context) {
    AlertDialog fail = AlertDialog(
      title: Text("Congrats!"),
      content: Text("Your information has been updated!"),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return fail;
      },
    );
  }
}
