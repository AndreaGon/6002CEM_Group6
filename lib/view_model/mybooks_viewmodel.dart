import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MyBooksVM {

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> DeleteBook(String bookId) {
  return books.doc(bookId).delete();
  }

  Stream getMyBooks() {
    Stream<QuerySnapshot> querySnapshot=  FirebaseFirestore.instance.collection('books').where("uploaded_by", isEqualTo: userId).snapshots();
    return querySnapshot;
  }

  Future<String> getImage(String imageUrl) async {
    var downloadUrl = await storage
        .ref()
        .child(imageUrl)
        .getDownloadURL();

    return await downloadUrl;
  }

}




