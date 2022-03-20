import 'dart:convert';

import 'package:meta/meta.dart';

class ChatBoxModel {
  String postId;
  String question;
  String reply;
  String postDate;
  ChatBoxModel({
    required this.postId,
    required this.question,
    required this.reply,
    required this.postDate,
  });

  @override
  String toString() {
    return 'ChatBoxModel(postId : $postId, question: $question, reply: $reply, postDate: $postDate,)';
  }

  factory ChatBoxModel.fromJson(Map<String, dynamic> json) {
    return ChatBoxModel(
      postId: json['postId'],
      question: json['question'],
      reply: json['reply'],
      postDate: json['postDate'],
    );
  }

  static List<ChatBoxModel> fromListJson(List<dynamic> json) {
    List<ChatBoxModel> result = [];
    for (Map<String, dynamic> d in json) {
      ChatBoxModel chatboxtModel = ChatBoxModel.fromJson(d);
      result.add(chatboxtModel);
    }
    return result;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        question.hashCode ^
        reply.hashCode ^
        postDate.hashCode;
  }
}
