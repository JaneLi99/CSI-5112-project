import 'package:flutter/material.dart';

<<<<<<< HEAD
=======
import '../models/user.dart';
import 'package:csi5112/category/category_page.dart';
import 'package:csi5112/httprequest/delete_data.dart';
import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/httprequest/put_data.dart';
import 'package:csi5112/login/login_page.dart';
import 'package:csi5112/models/product.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter/foundation.dart';
import '../models/product_models_mock.dart';
import '../main.dart';
import 'package:csi5112/httprequest/get_data.dart';

>>>>>>> a54d77b (Updated user setting)
class UserSettingRight extends StatefulWidget {
  @override
  _UserSettingRightState createState() => _UserSettingRightState();
}

class _UserSettingRightState extends State<UserSettingRight> {
<<<<<<< HEAD
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
=======
  TextEditingController updateUserName = TextEditingController();
  TextEditingController updatePhoneNumber = TextEditingController();
  TextEditingController updateAddress = TextEditingController();
  TextEditingController updateEmail = TextEditingController();
  TextEditingController updatePassword = TextEditingController();

  late Future<List<UserModel>> userList;
  List<UserModel> localUserList = [];

  @override
  void initState() {
    super.initState();
    userList = HttpGet.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        }
        localUserList = [...snapshot.data as List<UserModel>];
        UserModel user = localUserList[0];
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
                            // TextField(
                            //   controller: updateEmail,
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     hintText: "Email Address: ${user.email}",
                            //     fillColor: Colors.white,
                            //     border: InputBorder.none,
                            //   ),
                            // ),
                            // SizedBox(height: 8.0),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (updateUserName.text != "") {
                                      print(updateUserName.text);
                                      updatedUser.userName =
                                          updateUserName.text;
                                      // updatedUser.userName = "9";
                                    }
                                    if (updatePassword.text != "") {
                                      print(updatePassword.text);
                                      updatedUser.password =
                                          updatePassword.text;
                                      // updatedUser.password = "99";
                                    }
                                    if (updatePhoneNumber.text != "") {
                                      print("phonenumber: " +
                                          updatePhoneNumber.text);
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
      },
      future: userList,
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
>>>>>>> a54d77b (Updated user setting)
    );
  }
}
