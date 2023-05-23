import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

class BookInfoVM {

  Future getBookInfo(String bookId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("books").doc(bookId).get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data();  }
    } catch (e) {
      throw Exception('Error occurred while fetching book information: $e');
    }
  }

  Future<String> getImageUrl(String imageUrl) async {
    var downloadUrl = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(imageUrl)
        .getDownloadURL();

    await downloadUrl as String;
    return downloadUrl;
  }


}