import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:bookbridge/models/user.dart';
import 'package:flutter/material.dart';


class RegisterVM {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(BuildContext context,String username, String email, String birthdate, String gender, String password) async{
    String createUsername = username;
    String createEmail = email;
    String createBirthdate = birthdate;
    String createGender = gender;
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createNewUser(createUsername, createEmail, createGender, createBirthdate);
      return "ok";
    }on FirebaseAuthException catch(e){
      print(e);
      if(e.code == 'weak-password'){
        return "Password too weak! Please change your password!";
      }
      else if(e.code == 'email-already-in-use'){
        return "Email already registered, please login or register with another email!";
      }
      else{
        return "Unknown error occurred...";
      }
    }
  }

  //function to create new user in firesore db
  Future createNewUser(String createUsername, String createEmail, createGender, String createBirthdate) async {
    final docPost = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    Users postJson = Users(
      id: FirebaseAuth.instance.currentUser!.uid,
      email: createEmail,
      username: createUsername,
      gender: createGender,
      birthdate: createBirthdate,
      rating : 0.0,
    );

    await docPost.set(postJson.toJson());
  }
}


