import 'package:cloud_firestore/cloud_firestore.dart';

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

}