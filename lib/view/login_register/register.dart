import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';
import 'textfield.dart';
import '../help_center/help_center.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

import '../../view_model/register_viewmodel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  String? gender;
  TextEditingController password = TextEditingController();
  String dateText = "Enter your birthdate";
  String genderText = "Select your gender";
  String registerStatusText = " ";

  checkRegister(registerStatus){ //redirect to home page if successfully registered in
    if (registerStatus == "ok"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  hintTextColor(hint){
    if(hint != "Enter your birthdate" && hint != "Select your gender"){
      return Colors.black;
    }else{
      return lightgrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_4.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      //spacing
                      height: 70,
                    ),
                    Image.asset('assets/applogo.png'),
                    const SizedBox(
                      //spacing
                      height: 25,
                    ),
                    const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Create an account and start.",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      //spacing
                      height: 60,
                    ),
                    LoginRegisTextField(
                        //text field for username
                        hintText: "Enter your username",
                        valueController: username,
                        onChanged: () {
                          setState(() {});
                        }), //text field for username
                    const SizedBox(
                      //spacing
                      height: 15,
                    ),
                    LoginRegisTextField(
                        //text field for email
                        hintText: "Enter your email",
                        valueController: email,
                        onChanged: () {
                          setState(() {});
                        }), //text field for email
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        birthdate.text = date.toString().substring(0, 10);
                        dateText = birthdate.text;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 8),
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              dateText,
                              style: TextStyle(
                                  color: hintTextColor(dateText), fontSize: 17),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () async {
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2050));
                                  birthdate.text =
                                      date.toString().substring(0, 10);
                                  dateText = birthdate.text;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: darkbrown,
                                )),
                          ],
                        ),
                      ),
                    ), //text field for birthdate
                    const SizedBox(
                      //spacing
                      height: 15,
                    ),
                    Container(
                      //text field for gender
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 8),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 0.0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DropdownButton(
                        hint: Text(
                          genderText,
                          style: TextStyle(
                              fontSize: 17, color: hintTextColor(genderText)),
                        ),
                        value: gender,
                        //text field for gender
                        isExpanded: true,
                        items: ["Male", "Female", "Prefer Not to Say"]
                            .map(
                              (v) => DropdownMenuItem(
                                value: v,
                                child: Text(v),
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          gender = v! as String?;
                          setState(() {});
                        },
                      ),
                    ), //text field for gender
                    const SizedBox(
                      //spacing
                      height: 15,
                    ),
                    SizedBox( //text field for password
                      width: 300,
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: password,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your password",
                          hintStyle: const TextStyle(
                            fontSize: 17,
                            color: lightgrey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      //spacing
                      height: 15,
                    ),
                    Text(//text for warning if fail to register
                    registerStatusText,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                    InkWell(
                      //sign in button
                      onTap: () {
                        registerStatusText = register(username.toString(), email.toString(), birthdate.toString(), gender, password.toString());
                        setState(() {}); //hide the progress bar again if has error and stayed on this page...
                        checkRegister(registerStatusText);
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: darkbrown,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 6)),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      //spacing
                      height: 50,
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpCenter()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  //redirect to sign up page
                                  "Need Help?",
                                  style: TextStyle(
                                    color: chocolate,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?  ",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      //redirect to sign up page
                                      "Sign In",
                                      style: TextStyle(
                                        color: chocolate,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
