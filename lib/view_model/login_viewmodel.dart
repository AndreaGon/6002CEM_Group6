import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:bookbridge/view/login_register/login.dart';
import 'package:flutter/material.dart';


String loginEmail = "";
String loginPassword = "";

//function for firebase auth verify and login
login (email, password) {
  if(email != null && password != null){
    bool isValid = false;
    if ((regex.hasMatch(email)))
      isValid = true;

    if(isValid){
        firebaseLogin();
        return "ok";
    }else{
      return "Please enter a valid email!";
    }
  }
  else{
    return "Please fill in all the fields!";
  }

}

Future firebaseLogin() async{
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginEmail.trim(),
      password: loginPassword.trim(),
    );
  } on FirebaseAuthException catch (e) {
    return e.toString();
  }
}



