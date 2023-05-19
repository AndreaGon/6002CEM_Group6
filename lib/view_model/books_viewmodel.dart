import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BooksVM {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publishedyearController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference books = FirebaseFirestore.instance.collection('books');

  Future uploadBook() {
    // Call the user's CollectionReference to add a new user
    return books
        .add({
      'name': nameController.text,
      'book_cover': 'book_cover',
      'author': authorController.text,
      'published_year': publishedyearController.text,
      'other_img': 'other_img',
      'price': priceController.text,
      'summary': summaryController.text,
      'uploaded_by': 'user1',
    })
        .then((value) => print("Book Added"))
        .catchError((error) => print("Failed to add book: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

