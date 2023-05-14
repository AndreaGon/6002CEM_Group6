import 'dart:ui';

import 'package:bookbridge/res/colors.dart';
import 'package:flutter/material.dart';
import '../../models/register_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_4.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  //spacing
                  height: 35,
                ),
                Image.asset('assets/applogo.png'),
                const SizedBox(
                  //spacing
                  height: 35,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Create an account and start.",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  //spacing
                  height: 15,
                ),
                const TextField(), //text field for username
                const SizedBox(
                  //spacing
                  height: 5,
                ),
                const TextField(), //text field for email
                const SizedBox(
                  height: 50,
                ),
                const TextField(), //text field for birth date
                const SizedBox(
                  //spacing
                  height: 5,
                ),
                const TextField(), //text field for gender
                const SizedBox(
                  //spacing
                  height: 5,
                ),
                const TextField(), //text field for password
                const SizedBox(
                  //spacing
                  height: 5,
                ),
                const Text(
                  "", //text for warning if login failure
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  //sign in button
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: darkbrown,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: white,
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
                Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            //redirect to sign up page
                            "Sign Up",
                            style: TextStyle(
                              color: tan,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
