import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class BooksVM {

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Stream getAllBooks() {
    Stream<QuerySnapshot> querySnapshot=  FirebaseFirestore.instance.collection('books').orderBy('datetime', descending: true).snapshots();
    return querySnapshot;
  }

}