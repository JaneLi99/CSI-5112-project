import 'package:flutter/foundation.dart';

import 'chatbox.dart';

class ChatBoxListModel with ChangeNotifier {
  static List<ChatBoxModel> chatbox = [
    ChatBoxModel(
        postId: "post001",
        question: "Where can I update my address?",
        reply: "Go to customer account.",
        postDate: "2021-07-28"),
    ChatBoxModel(
        postId: "post002",
        question: "How much does the delivery cost?",
        reply:
            "It may cost 10, 20, 50, 100 dollars, but it depends on how much you buy.",
        postDate: "2022-02-22"),
    ChatBoxModel(
        postId: "post003",
        question: "Can I get coupon by any chances?",
        reply: "Yes, in your dream",
        postDate: "2022-03-12"),
    ChatBoxModel(
        postId: "post004",
        question: "Can I get coupon by any chances?",
        reply: "",
        postDate: "2022-03-12"),
  ];
}
