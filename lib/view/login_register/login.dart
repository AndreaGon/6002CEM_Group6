//referenced: https://www.youtube.com/watch?v=X1nQwpSS0H8

import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';
import '../help_center/help_center.dart';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:bookbridge/view/login_register/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String loginStatusText = " ";

  handleSubmit() async {
    //function for login credential handling before going to firebase auth
    if (!loginFormKey.currentState!.validate()) return;

    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    setState(() {
      _loading = true; //for the loading progress bar
    });

    loginStatusText = await LoginVM().login(context, email, password);

    if (loginStatusText == "ok") {
      //redirect to home page... succ method, might change ltr when have time
      Navigator
          .of(context)
          .pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => HomePage()
          ));
    }else{
      setState(() {
        _loading = false;
      });
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
        body: SafeArea(
          child: Form(
            key: loginFormKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        //spacing
                        height: 70,
                      ),
                      const Text(
                        "Welcome To BookBridge",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        //spacing
                        height: 60,
                      ),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Please sign in to continue.",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        //spacing
                        height: 60,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _emailController,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (EmailValidator.validate(value) ==
                                false) {
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your email",
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
                        ),
                      ), //text field for email
                      const SizedBox(
                        //spacing
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          //text field for password
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
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
                      ), //password textfield
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        loginStatusText,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),//text for warning if has error during login
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => handleSubmit(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkbrown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.grey.withOpacity(0.9),
                          ),
                          child: Center(
                            child: _loading
                                ? const SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: white,
                                strokeWidth: 2,
                              ),
                            )
                                : const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ), //sign in button
                      const SizedBox(
                        //spacing
                        height: 50,
                      ),
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row( //sign up?
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?  ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const Register()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          //redirect to sign up page
                                          "Sign Up",
                                          style: TextStyle(
                                            color: chocolate,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding( //need help?
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //need help and sign up
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
