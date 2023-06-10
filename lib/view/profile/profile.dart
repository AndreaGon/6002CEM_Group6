import 'package:bookbridge/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:bookbridge/view/home/side_navi.dart';
import 'package:bookbridge/view/inbox/inbox.dart';
import 'package:bookbridge/view_model/profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../view_model/rating_viewmodel.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  //fetch current user id from firebase auth instance
  String currentUserID = FirebaseAuth.instance.currentUser!.uid;
  RatingVM ratingVM = RatingVM();


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_5.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: null,
            backgroundColor: white,
            elevation: 0,
            iconTheme: const IconThemeData(color: darkbrown),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Inbox()));
                    },
                    child: const Icon(
                      Icons.chat_outlined,
                    ),
                  )),
            ]),
        //list tile of side menu
        drawer: SideNavi(),
        body: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 5, color: chocolate),
                  )),
                  child: const Text("Profile",
                      style: TextStyle(
                          height: 2,
                          fontSize: 30,
                          color: darkbrown,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              FutureBuilder(
                future: ProfileVM().getProfile(currentUserID),
                builder: (context, AsyncSnapshot documentSnapshot) {
                  if (documentSnapshot.data == null) {
                    return SizedBox(
                      width: 250,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Something went wrong while fetching for user data...",
                          style: TextStyle(
                            fontSize: 20,
                            color: darkbrown,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    );
                  }
                  //assign fetch data to map
                  Map<String, dynamic> userInfoModel = documentSnapshot.data;
                  return SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          //spacing
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Username: ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              userInfoModel['username'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ), //text box for username
                        const SizedBox(
                          //spacing
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Email Address: ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              userInfoModel['email'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ), //text box for email
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Ratings: ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              userInfoModel['rating'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ), //text box for ratings
                        const SizedBox(
                          //spacing
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Birth Date: ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              userInfoModel['birthdate'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ), //text field for birthdate
                        const SizedBox(
                          //spacing
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Gender: ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Container(
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              userInfoModel['gender'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ), //text box for gender
                        const SizedBox(
                          //spacing
                          height: 15,
                        ), //need help and sign in if got acc
                      ],
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
