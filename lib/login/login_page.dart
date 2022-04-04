import 'package:csi5112/customer/CustomerMain.dart';
import 'package:csi5112/merchant/Merchant_Main.dart';
import 'package:flutter/material.dart';
import 'package:csi5112/login/register_page.dart';
import 'package:csi5112/models/user.dart';

import '../httprequest/get_data.dart';

UserModel currentUser = new UserModel(
    userId: "", password: "", userName: "", phoneNumber: "", address: "");
List<UserModel> localUser = [];

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisibility = false;

  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();
    users = HttpGet.fetchUsers();
  }

  TextEditingController userNameInput = TextEditingController();
  TextEditingController userPasswordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        }
        localUser = [...snapshot.data as List<UserModel>];

        // print(localUser.toString());

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/grocerycover.png'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.only(left: 150, top: 150),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('LetsGrocery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: userNameInputField()),
                        userPasswordInputField(),
                        const SizedBox(height: 40),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10.0,
                          runSpacing: 20.0,
                          children: [
                            InkWell(
                              onTap: () {
                                bool loginSuccess = false;
                                // print(userNameInput.text);
                                for (int i = 0; i < localUser.length; i++) {
                                  if (userNameInput.text ==
                                          localUser[i].userName &&
                                      userPasswordInput.text ==
                                          localUser[i].password) {
                                    currentUser = localUser[i];
                                    // print(currentUser.toString());
                                    loginSuccess = true;
                                    break;
                                  }
                                }
                                if (loginSuccess) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerMain()));
                                } else if (userNameInput.text == "") {
                                  showUserNameEmptyAlert(context);
                                } else {
                                  showLoginFailAlert(context);
                                }
                              },
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
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                if (userNameInput.text == "Admin" &&
                                    userPasswordInput.text == "Admin123") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MerchantMain()));
                                } else {
                                  showAdminLoginFailAlert(context);
                                }
                              },
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
                                      'Administrator Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
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
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 2, child: Card()),
                ],
              ),
            ),
          ),
        );
      },
      future: users,
    );
  }

  Widget userNameInputField() {
    return Card(
        color: Colors.grey.withOpacity(.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: userNameInput,
            decoration: InputDecoration(
                labelText: 'User ID',
                suffixIcon: Icon(Icons.person, color: Colors.grey[300]),
                labelStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none),
          ),
        ));
  }

  Widget userPasswordInputField() {
    return Card(
        color: Colors.grey.withOpacity(.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: userPasswordInput,
            decoration: InputDecoration(
                labelText: 'password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.grey[300],
                  ),
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                ),
                labelStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none),
          ),
        ));
  }

  showLoginFailAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert: Login Failed"),
          insetPadding: EdgeInsets.zero,
          content: Text("Your username or password is incorrect."),
        );
        ;
      },
    );
  }

  showAdminLoginFailAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert: Login Failed"),
          insetPadding: EdgeInsets.zero,
          content: Text("Admin username or password is incorrect"),
        );
        ;
      },
    );
  }

  showUserNameEmptyAlert(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert: Login Failed"),
          insetPadding: EdgeInsets.zero,
          content: Text("Please enter a username to login"),
        );
      },
    );
  }
}
