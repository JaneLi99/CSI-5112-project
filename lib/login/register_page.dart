import 'package:csi5112/models/user.dart';
import 'package:flutter/material.dart';
import 'package:csi5112/httprequest/get_data.dart';

import '../customer/CustomerMain.dart';
import '../httprequest/post_data.dart';
import '../login/login_page.dart' as loginPage;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisibility = false;

  get onPressed => null;

  late Future<List<UserModel>> users;
  List<UserModel> localUsers = [];

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
        localUsers = [...snapshot.data as List<UserModel>];
        // print(localUsers);

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
                              'Create new account.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white),
                            )),
                        Row(
                          children: [
                            const Text(
                              'Already A Member?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => loginPage.LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          color: Colors.grey.withOpacity(.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: userNameInput,
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  suffixIcon: Icon(
                                    Icons.assignment_ind,
                                    color: Colors.grey[300],
                                  ),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Card(
                            color: Colors.grey.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                    labelStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    border: InputBorder.none),
                              ),
                            )),
                        const SizedBox(height: 40),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10.0,
                          runSpacing: 20.0,
                          children: [
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
                                    'Sign Up with Google',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                bool found = false;
                                for (int i = 0; i < localUsers.length; i++) {
                                  if (userNameInput.text ==
                                      localUsers[i].userName) {
                                    showUserExistsAlert();
                                    found = true;
                                    break;
                                  }
                                }
                                if (!found) {
                                  if (userPasswordInput.text == "") {
                                    showPasswordEmptyAlert();
                                  } else {
                                    String newUserName = userNameInput.text;
                                    String newUserPassword =
                                        userPasswordInput.text;
                                    String newUserPhoneNumber =
                                        "Please initialize your phone number";
                                    String newUserAddress =
                                        "Please initialize your address";
                                    UserModel newUser = new UserModel(
                                        userId: "1",
                                        password: newUserPassword,
                                        userName: newUserName,
                                        phoneNumber: newUserPhoneNumber,
                                        address: newUserAddress);

                                    HttpPost.postUserData(newUser);
                                    loginPage.currentUser = newUser;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerMain()));
                                  }
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
                                      'Create account',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            )
                          ],
                        )
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

  showUserExistsAlert() {
    AlertDialog alert = AlertDialog(
      title: Text("Alert: Create Account Failed"),
      insetPadding: EdgeInsets.zero,
      content: Text("The username is existed."),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(child: alert);
      },
    );
  }

  showPasswordEmptyAlert() {
    AlertDialog alert = AlertDialog(
      title: Text("Alert: Create Account Failed"),
      insetPadding: EdgeInsets.zero,
      content: Text("Please enter your password."),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(child: alert);
      },
    );
  }
}
