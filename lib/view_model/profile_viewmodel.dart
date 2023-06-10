import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileVM {

  //get doc by book id
  Future getProfile(String userID) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(userID).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data();  }
    } catch (e) {
      throw Exception('Error occurred while fetching user information: $e');
    }
  }

}