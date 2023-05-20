import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InboxVM {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference books = FirebaseFirestore.instance.collection('chats');

  Future getAllInbox() async {
    String currentUserId = await LoginVM().getCurrentUserId();
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("chats").where("members", arrayContains: currentUserId).get();
    return querySnapshot;
  }


}

