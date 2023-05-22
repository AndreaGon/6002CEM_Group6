import 'package:cloud_firestore/cloud_firestore.dart';

class BookInfoVM {

  Future getBookInfo(String bookId) async {
    try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("books").where("id", isEqualTo: bookId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs[0].data();  }
    } catch (e) {
      throw Exception('Error occurred while fetching book information: $e');
    }
  }

}