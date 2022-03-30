import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/merchant/Merchant_Main.dart';
import 'package:csi5112/models/chatbox.dart';
import 'package:flutter/material.dart';
import 'package:csi5112/httprequest/get_data.dart';

import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:csi5112/httprequest/put_data.dart';

import '../main.dart';

String currentQuestion = "";
String currentAnswer = "";
List<ChatBoxModel> LocalChatboxList = [];
int counter = 0;
late Future<List<ChatBoxModel>> chatBoxList;

class ChatBoxMerchant extends StatefulWidget {
  @override
  _ChatBoxMerchantState createState() => _ChatBoxMerchantState();
}

class _ChatBoxMerchantState extends State<ChatBoxMerchant> {
  @override
  void initState() {
    super.initState();
    chatBoxList = HttpGet.fetchChatbox();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatBoxModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          // print("empty");
          return const CircularProgressIndicator();
        }
        LocalChatboxList = [...snapshot.data as List<ChatBoxModel>];
        counter = LocalChatboxList.length;
        // print(counter);
        return Scaffold(
          backgroundColor: Colors.yellow[50],
          appBar: buildAppBar(),
          body: Column(
            children: [
              Expanded(
                child: ChatBoxView(),
              ),
            ],
          ),
        );
      },
      future: chatBoxList,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text(
        "Answer the Questions for your Customers",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget ChatBoxView() {
    return Container(
      padding: EdgeInsets.all(64.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < LocalChatboxList.length; i++)
            ChatBoxRow(LocalChatboxList[i]),
          // addNewQuestion(),
        ],
      ),
    );
  }

  Widget ChatBoxRow(ChatBoxModel c) {
    bool showReply = false;
    bool showTextField = true;
    if (c.reply != "") {
      showReply = true;
      showTextField = false;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${c.question}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showReply) Text("${c.reply}"),
        if (showTextField) UserInputArea(c),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget UserInputArea(ChatBoxModel c) {
    TextEditingController addReply = TextEditingController();
    return Row(
      children: [
        SizedBox(
          width: 500,
          child: TextField(
            controller: addReply,
            decoration: InputDecoration(
              hintText:
                  "The answer has not been answered yet. Add your reply here:",
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
            color: Colors.blue[200],
            onPressed: () {
              setState(() {
                c.reply = addReply.text;
                HttpPut.updateChatboxData(c);
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MerchantMain()));
            },
            child: Text("Submit")),
      ],
    );
  }
}
