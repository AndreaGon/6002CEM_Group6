import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

class AddBooksVM {

  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  //add book data
  Future uploadBook(String name, String author, String year, String summary, String price, String bookcover, String bookcondition, String datetime) {
    //set book name to lower case for search book function
    var lowercaseName = name.toLowerCase();
    return books
        .add({
      'name': name,
      'book_cover': bookcover,
      'author': author,
      'published_year': year,
      'other_img': bookcondition,
      'price': price,
      'summary': summary,
      'uploaded_by': userId,
      'datetime' : datetime,
      'lowercaseName' : lowercaseName
    })
        .then((value) => {
          books.doc(value.id).update({
            "id": value.id
          })
    })
        .catchError((error) => print("Failed to add book: $error"));
  }

  //add book cover to storage
  Future uploadBookCover(File _coverphoto) async {
    final BookCover = basename(_coverphoto.path);
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref().child('BookCover').child(userId).child(BookCover);
      await ref.putFile(_coverphoto);
    } catch (e) {
      print('error occurred');
    }
  }

  //add book condition to storage
  Future uploadBookCondition(File _conditionphoto) async {
    final BookCondition = basename(_conditionphoto.path);
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref().child('BookCondition').child(userId).child(BookCondition);
      await ref.putFile(_conditionphoto);
    } catch (e) {
      print('error occurred');
    }
  }
}

