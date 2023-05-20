import 'dart:core';

class ChatsModel {
  final String chat_name;
  final String id;
  final List<String> members;
  final String recent_message;
  final String recent_sender;

  ChatsModel({
    required this.chat_name,
    required this.id,
    required this.members,
    required this.recent_message,
    required this.recent_sender});

  Map<String, dynamic> toJson() => {
    'id': id,
    'chat_name': chat_name,
    'members': members,
    'recent_message': recent_message,
    'recent_sender': recent_sender,
  };
}