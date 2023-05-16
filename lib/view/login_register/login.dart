import 'package:bookbridge/res/colors.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import '../help_center/help_center.dart';
import 'textfield.dart';

import '../../models/login_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Please sign in to continue.",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  //spacing
                  height: 60,
                ),
                LoginRegisTextField( //text field for email
                  hintText: "Enter your email",
                  valueController: email,
                  onChanged: (){
                    setState(() {});
                  }),
                const SizedBox(
                  //spacing
                  height: 15,
                ),
                LoginRegisTextField( //text field for password
                    hintText: "Enter your password",
                    valueController: password,
                    onChanged: (){
                      setState(() {});
                    }),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "", //text for warning if login failure
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  //sign in button
                  onTap: () {

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
                        "Sign In",
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
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?  ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
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
                          ],
                        ),
                        const SizedBox(height: 7,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenter()));
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
