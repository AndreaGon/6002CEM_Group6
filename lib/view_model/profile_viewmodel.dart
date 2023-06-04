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

  getRating(String currentUserId) async{
    double accumulateRating = 0.0;
    int numberOfRaters = 0;
    double averageRating = 0.0;

    String ratingCollection = 'ratings/' + currentUserId + '/all_ratings';
    //check if the user is rated before,
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', '')).where("ratedBy", isEqualTo: "none").get();
    if(querySnapshot.docs.length == 0){
      Map<String, dynamic> allRatings = getAllRatings(currentUserId) as Map<String, dynamic>;
      for (double ratings in allRatings["rating"]){
        accumulateRating += ratings;
        numberOfRaters += 1;
      }
      averageRating = accumulateRating / numberOfRaters;
      return averageRating.toString();//if yes (no initial created doc found)

    }
    else{ //if found initial rating doc(never rated by others before)
      return "0.0";
    }
  }

  Future getAllRatings(String currentUserId) async{
    String ratingCollection = 'ratings/' + currentUserId + '/all_ratings';
    CollectionReference ratings = FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', ''));
    //grabbing all existing rating from the collection
    return await ratings.snapshots();
  }

}