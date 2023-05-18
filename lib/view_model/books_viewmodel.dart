import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BooksVM {

  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future uploadBook(String name, String author, String year, String summary, String price) {
    return books
        .add({
      'name': name,
      'book_cover': 'book_cover',
      'author': author,
      'published_year': year,
      'other_img': 'other_img',
      'price': price,
      'summary': summary,
      'uploaded_by': userId,
    })
        .then((value) => print("Book Added"))
        .catchError((error) => print("Failed to add book: $error"));
  }
}

