import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatsVM {
  // Create a CollectionReference called users that references the firestore collection

  Stream getAllMessages(String docId) {
    CollectionReference books = FirebaseFirestore.instance.collection('chats').doc(docId).collection("messages");
    Stream<QuerySnapshot> querySnapshot= books.orderBy("time").snapshots();
    return querySnapshot;
  }

  Future sendMessage(String docId, Map<String, dynamic> chatMessageData) async {
    String fullCollection = 'chats/' + docId + '/messages';
    return FirebaseFirestore.instance.collection(fullCollection.replaceAll(' ', ''))
        .add(chatMessageData);
  }


}

