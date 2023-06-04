import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:bookbridge/view_model/rating_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../res/colors.dart';
import '../../../view_model/login_viewmodel.dart';

class RatingDialog extends StatefulWidget {
  RatingDialog({super.key,required this.sub_name});

  String sub_name;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  String ratingSubmitStatus = "initial_status";
  double rating = 5.0; //initial rating

  //view models
  RatingVM ratingVM = RatingVM();
  LoginVM loginVM = LoginVM();

  submitRating() async{
    Map<String, dynamic> userInfo = await loginVM.getUserInformation(currentUserId);
    Map<String, dynamic> sellerInfo = await ratingVM.getSellerInfo(widget.sub_name); //get seller id based on seller name

    String _sellerId = sellerInfo["id"]; //store seller's uid
    bool _isRated = await ratingVM.isRated(_sellerId, currentUserId);


    if(userInfo["username"] == widget.sub_name){ //check if the seller is rating themselves lol
      Fluttertoast.showToast(
        msg: "You cannot rate yourself!",
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.pop(context); //close dialog
      return;
    }
    else if(_isRated == true){ //check if the user has already rated the seller
      Fluttertoast.showToast(
        msg: "You already rated the seller!",
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.pop(context); //close dialog
      return;
    }
    else{
      ratingSubmitStatus = await ratingVM.rateSeller(rating, _sellerId); //call function to submit rating to db and display the status

      if(ratingSubmitStatus == "ok"){ //rating successfully submitted
        Fluttertoast.showToast(
          msg: "Successfully rated the seller :)",
          gravity: ToastGravity.BOTTOM,
        );
        Navigator.pop(context); //close dialog
        return;
      }
      else{ //something went wrong when submitting to db
        Fluttertoast.showToast(
          msg: ratingSubmitStatus,
          gravity: ToastGravity.BOTTOM,
        );
        Navigator.pop(context); //close dialog
        return;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rate ${widget.sub_name} :",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              SmoothStarRating(
                allowHalfRating: true,
                onRatingChanged: (v) {
                  rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: rating,
                size: 40.0,
                filledIconData: Icons.star_rounded,
                halfFilledIconData: Icons.star_half_rounded,
                defaultIconData: Icons.star_outline_rounded,
                color: Colors.orangeAccent,
                borderColor: Colors.orangeAccent,
                spacing: 0.5,
              ),
              SizedBox(
                height: 2,
              ),
              ElevatedButton(
                  onPressed: () {
                    submitRating();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkbrown,
                    padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                  ),
                  child: Text(
                    "Rate",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
