import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class BooksVM {

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  //get all books sorted from latest
  Stream getAllBooks() {
    Stream<QuerySnapshot> querySnapshot=  FirebaseFirestore.instance.collection('books').orderBy('datetime', descending: true).snapshots();
    return querySnapshot;
  }

  //get book cover
  Future<String> getImage(String imageUrl) async {
    var downloadUrl = await storage
        .ref()
        .child(imageUrl)
        .getDownloadURL();

    return await downloadUrl;
  }


}