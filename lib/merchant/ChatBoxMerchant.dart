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
          return const CircularProgressIndicator();
        }
        LocalChatboxList = [...snapshot.data as List<ChatBoxModel>];
        counter = LocalChatboxList.length;
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
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0),
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
        ],
      ),
    );
  }

  Widget ChatBoxRow(ChatBoxModel c) {
    List<String> replies = [];
    replies = c.reply.split('^^^');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 500,
              child: Text(
                "${c.question}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (replies.length > 1)
              TextButton(
                  onPressed: () {
                    showMoreRepliesAlert(context, c);
                  },
                  child: Text("show ${replies.length - 1} reply (replies)")),
          ],
        ),
        UserInputArea(c),
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
          height: 35,
          width: 500,
          child: TextField(
            controller: addReply,
            decoration: InputDecoration(
              hintText: "Add your reply here:",
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton(
            color: Colors.blue[200],
            onPressed: () {
              setState(() {
                if (addReply.text != "") {
                  c.reply = c.reply + addReply.text + "^^^";
                  HttpPut.updateChatboxData(c);
                }
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MerchantMain()));
            },
            child: Text("Submit")),
      ],
    );
  }

  showMoreRepliesAlert(BuildContext context, ChatBoxModel c) {
    List<String> replies = c.reply.split("^^^");
    String reply = "";
    for (int i = 0; i < replies.length - 1; i++) {
      reply += "Reply ${i + 1}: " + replies[i] + " \n\n";
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${c.question}"),
          // content: Text("Your information has been updated!"),
          content: Text(reply),
        );
        ;
      },
    );
  }
}
