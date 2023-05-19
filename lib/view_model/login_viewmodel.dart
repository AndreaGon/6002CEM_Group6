import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginVM{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login(BuildContext context,String email, String password) async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      return "ok";
    }on FirebaseAuthException catch(e){
      print(e);
      if(e.code == 'user-not-found'){
          return "User not found, check your email or register an account...";
      }
      else if(e.code == 'wrong-password'){
          return "Incorrect password...";
      }
      else{
        return "Some error occurred...";
      }
    }
  }

  Future getCurrentUserId() async{
    return _auth.currentUser!.uid;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future getUserInformation(String userId) async {
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("user").where("id", isEqualTo: userId).get();
    return querySnapshot.docs[0].data();
  }
}




