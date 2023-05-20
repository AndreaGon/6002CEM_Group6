import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AllBooksVM {

  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String userId = FirebaseAuth.instance.currentUser!.uid;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Stream collectionStream = FirebaseFirestore.instance.collection('books').snapshots();

  Future<List<Object?>> getAllBooks() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await books.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }



}