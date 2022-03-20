import 'package:csi5112/httprequest/post_data.dart';
import 'package:csi5112/models/chatbox.dart';
import 'package:flutter/material.dart';
import '../models/chatbox_model_mock.dart';
import 'package:csi5112/customer/CustomerMain.dart';
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

class ChatBoxCustomer extends StatefulWidget {
  @override
  _ChatBoxCustomerState createState() => _ChatBoxCustomerState();
}

class _ChatBoxCustomerState extends State<ChatBoxCustomer> {
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
      // iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        "Have any questions?",
        style: TextStyle(color: Colors.black),
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
          addNewQuestion(),
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
          width: 10,
        ),
        RaisedButton(
            color: Colors.blue[200],
            onPressed: () {
              setState(() {
                c.reply = addReply.text;
                HttpPut.updateChatboxData(c);
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerMain()));
            },
            child: Text("Submit")),
      ],
    );
  }

  Widget addNewQuestion() {
    TextEditingController addQuestion = TextEditingController();

    return Row(
      children: [
        SizedBox(
          width: 500,
          child: TextField(
            controller: addQuestion,
            decoration: InputDecoration(
              hintText: "Add new question here:",
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
                ChatBoxModel newQuestion = new ChatBoxModel(
                    postId: "post${counter}",
                    question: "${addQuestion.text}",
                    reply: "",
                    postDate: "2022-02-22");
                // LocalChatboxList.add(newQuestion);
                HttpPost.postChatboxData(newQuestion);
                counter++;
              });

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerMain()));
            },
            child: Text("Submit")),
      ],
    );
  }
}
