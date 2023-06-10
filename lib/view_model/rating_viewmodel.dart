import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RatingVM{
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  String ratingSubmitStatus = "initial_status";
  double accumulateRating = 0.0;
  int totalRater = 0;
  double averageRating = 0.0;

  //function for submitting rating
  Future<String> rateSeller(double rating, String sellerId, double sellerAccumulateRating, int sellerTotalRater) async{
    String ratingCollection = 'ratings/' + sellerId + '/all_ratings';
    //compute new average rating, accumulate rating and total raters
    accumulateRating = sellerAccumulateRating + rating;
    totalRater = sellerTotalRater + 1;
    averageRating = accumulateRating / totalRater;

    //check if the seller is rated before,
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', '')).where("ratedBy", isEqualTo: "none").get();
    if(querySnapshot.docs.length == 0){ //if yes (no initial created doc found)
      submitRatingtoDB(rating, sellerId, currentUserId); //submit new rating
      updateAccumulateRating(accumulateRating, totalRater, sellerId); //update accumulate rating of the seller
      updateAverageRating(averageRating, sellerId); //update average rating info
    }
    else{ //if found initial rating doc(never rated by others before)
      submitInitialRatingtoDB(rating, sellerId, currentUserId); //call function to update the initial document for first rating
      updateAccumulateRating(accumulateRating, totalRater, sellerId); //update accumulate rating of the seller
      updateAverageRating(averageRating, sellerId); //update average rating info
    }

    return "ok";
  }

  //get seller username for sub_name comparison
  Future getSellerInfo(String sub_name) async {
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("users").where("username", isEqualTo: sub_name).get();
    return querySnapshot.docs[0].data();
  }

  //check if the user already rated the seller
  Future<bool> isRated(String sellerId, String currentUserId) async{
    String ratingCollection = 'ratings/' + sellerId + '/all_ratings';
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance
        .collection(ratingCollection.replaceAll(' ', ''))
        .where("ratedBy", isEqualTo: currentUserId).get();

    if(querySnapshot.docs.length == 0){ //return false if user is not found rated towards the seller
      return false;
    }else{ //return true if user is found rated towards the seller
      return true;
    }
  }

  //submit the first rating for the seller
  Future<String> submitInitialRatingtoDB(double rating, String sellerId, String currentUserId) async{
    String ratingCollection = 'ratings/' + sellerId + '/all_ratings';
    try {
      await FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', '')).doc(sellerId)
          .update({
        'id' : currentUserId,
        'ratedBy': currentUserId,
        'rating': rating.toString(),
      });
      return "ok";
    } catch(error){
      return "Failed upload rating: ${error.toString()}";
    }
  }

  //submit rating for the seller
  Future<String> submitRatingtoDB(double rating, String sellerId, String currentUserId) async{
    String ratingCollection = 'ratings/' + sellerId + '/all_ratings';
    try {
      await FirebaseFirestore.instance.collection(ratingCollection.replaceAll(' ', ''))
          .add({
        'id' : currentUserId,
        'ratedBy': currentUserId,
        'rating': rating.toString(),
      });
      return "ok";
    } catch(error){
      return "Failed upload rating: ${error.toString()}";
    }
  }

  Future getAccumulateRating(String sellerId) async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("ratings").where("id", isEqualTo: sellerId).get();
    return querySnapshot.docs[0].data();
  }

  //update accumulate rating and total raters
  Future<String> updateAccumulateRating(double accumulateRating, int totalRater, String sellerId) async{
    try {
      await FirebaseFirestore.instance.collection('ratings').doc(sellerId)
          .update({
        'accumulateRating' : accumulateRating.toString(),
        'totalRater': totalRater
      });
      return "ok";
    } catch(error){
      return "Failed upload rating: ${error.toString()}";
    }
  }

  //update average rating in profile
  Future<String> updateAverageRating(double averageRating, String sellerId) async{
    try {
      await FirebaseFirestore.instance.collection('users').doc(sellerId)
          .update({
        'rating' : averageRating.toString()
      });
      return "ok";
    } catch(error){
      return "Failed upload rating: ${error.toString()}";
    }
  }
}