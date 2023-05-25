import 'dart:core';

class ChatsModel {
  final String chat_name;
  final String id;
  final List<String> members;
  final String sub_name;
  final String recent_sender;

  ChatsModel({
    required this.chat_name,
    required this.id,
    required this.members,
    required this.sub_name,
    required this.recent_sender});

  Map<String, dynamic> toJson() => {
    'id': id,
    'chat_name': chat_name,
    'members': members,
    'sub_name': sub_name
  };
}