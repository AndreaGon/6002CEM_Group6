import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:bookbridge/models/user.dart';



String createUsername = "";
String createEmail = "";
String createGender = "";
String createBirthdate = "";
String createPassword = "";


//data validation and register
register(String? username, String? email, String? birthdate, String? gender, String? password){
  if (username != null &&
      email != null &&
      birthdate != null &&
      gender != null &&
      password != null){
    bool isValid = EmailValidator.validate(email);
    if( isValid == true && password.length > 8){
        createUsername = username;
        createEmail = email;
        createGender = gender;
        createBirthdate = birthdate;
        createPassword = password;

        signUp(); //register the user in firebase auth
        createNewUser(); //call the function to create user's document in db

      return "ok";
    }
    else if(password.length < 8){
      return "Password should be more than 8 characters!";
    }
    else if(EmailValidator.validate(email) == false){
      return "Please enter a valid email!";
    }
  }else{
    return "Please insert all fields!";
  }

}


Future signUp() async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: createEmail.trim(),
      password: createPassword.trim(),
    );

  } on FirebaseAuthException catch (e) {
    return e.toString();
  }
}



//function to create new user in firesore db
Future createNewUser() async {
  final docPost = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
  Users postJson = Users(
    id: FirebaseAuth.instance.currentUser!.uid,
    email: createEmail,
    username: createUsername,
    gender: createGender,
    birthdate : createBirthdate,
  );

  await docPost.set(postJson.toJson());

}







