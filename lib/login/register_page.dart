import 'package:flutter/material.dart';

import '../login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisibility = false;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
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
                                builder: (context) => LoginPage(),
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
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.grey.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'First name',
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
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.grey.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'Last name',
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
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Card(
                            color: Colors.grey.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'email',
                                    suffixIcon: Icon(Icons.email,
                                        color: Colors.grey[300]),
                                    labelStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    border: InputBorder.none),
                              ),
                            ))),
                    Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
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
  }
}
