import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InboxVM {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future getAllInbox() async {
    String currentUserId = await LoginVM().getCurrentUserId();
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("chats").where("members", arrayContains: currentUserId).get();
    return querySnapshot;
  }

  findInbox(String bookId) async {
    String currentUserId = await LoginVM().getCurrentUserId();
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("chats")
        .where("members", arrayContains: currentUserId)
        .where("related_book", isEqualTo: bookId).get();

    return querySnapshot.docs[0].data();
  }

  createNewInbox(String chatName, String recipient, String bookId) async {

    Map<String, dynamic> name = await LoginVM().getUserInformation(recipient);

    return chats.add({
      'chat_name': name["username"],
      'members' : [recipient, userId],
      'sub_name': chatName,
      'related_book': bookId
    }).then((value) => {
      chats.doc(value.id).update({
        "id": value.id
      })
    })
        .catchError((error) => print("Failed to add chat: $error"));;
  }

}

