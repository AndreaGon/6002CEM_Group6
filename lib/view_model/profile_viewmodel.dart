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

  Future<String> getRating(String currentUserId) async{
    double accumulateRating = 0.0;
    int numberOfRaters = 0;
    double averageRating = 0.0;
    String ratingFetched = "";
    Map<String, dynamic>? allRating;

    String ratingCollection = 'ratings/' + currentUserId + '/all_ratings';
      FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', '')).get()
          .then((querySnapshot){
              for (var docSnapshot in querySnapshot.docs){
                ratingFetched = docSnapshot["rating"].toString();
                accumulateRating += double.parse(ratingFetched);
                numberOfRaters ++;
              }
          }
      );
      averageRating = accumulateRating/numberOfRaters;
      String returnRating = averageRating.toString();
      return returnRating;
  }

  //check for initial rating
  Future<bool> initialRating(String currentUserId) async{
    String ratingCollection = 'ratings/' + currentUserId + '/all_ratings';
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance
        .collection(ratingCollection.replaceAll(' ', ''))
        .where("ratedBy", isEqualTo: "none").get();

    if(querySnapshot.docs.length == 0){ //return false if initial rating document is not found
      return false;
    }else{ //return true if initial rating is found
      return true;
    }
  }

}