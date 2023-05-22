import 'package:cloud_firestore/cloud_firestore.dart';

class BookInfoVM {

  Future getBookInfo(String Id) async {
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("books").where("id", isEqualTo: Id).get();
    return querySnapshot.docs[0].data();
  }

}