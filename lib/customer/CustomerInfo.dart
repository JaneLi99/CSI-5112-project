import 'package:flutter/material.dart';

class CustomerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(top: 10.0, left: 100),
                      child: const Text(
                        "Your Account -> Login & Security",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      padding: EdgeInsets.only(top: 10, left: 100),
                      child: const Text(
                        "Login & Security",
                        textScaleFactor: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 800.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blueGrey),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0))),
              margin: const EdgeInsets.all(4.0),
              child: const Text(
                "Usernamm: \n \n      @@_@@ ",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 800.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blueGrey),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0))),
              margin: const EdgeInsets.all(4.0),
              child: const Text(
                "Name: \n \n         Jay ",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 800.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blueGrey),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0))),
              margin: const EdgeInsets.all(4.0),
              child: const Text(
                "Mobile Phone Number: \n \n        6478823756",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 800.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blueGrey),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0))),
              margin: const EdgeInsets.all(4.0),
              child: const Text(
                "Password:  \n \n    **********",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 800.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blueGrey),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0))),
              margin: const EdgeInsets.all(4.0),
              child: const Text(
                "Security Question: \n \n        None",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

/*
          Expanded(child: ListView(
            children: const <Widget>[
              ListTile(
                title: Text("Name"),
              )
            ],
          ),)
*/
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer Homepage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(214, 50, 58, 65),
      ),
      body: container,
    );
  }
}
