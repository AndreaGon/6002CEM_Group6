import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatsVM {
  // Create a CollectionReference called users that references the firestore collection

  Stream getAllMessages(String docId) {
    String fullCollection = 'chats/' + docId + '/messages';
    CollectionReference books = FirebaseFirestore.instance.collection(fullCollection.replaceAll(' ', ''));
    Stream<QuerySnapshot> querySnapshot= books.orderBy("time", descending: true).snapshots();
    return querySnapshot;
  }

  Future sendMessage(String docId, Map<String, dynamic> chatMessageData) async {
    String fullCollection = 'chats/' + docId + '/messages';
    return FirebaseFirestore.instance.collection(fullCollection.replaceAll(' ', ''))
        .add(chatMessageData);
  }


}

