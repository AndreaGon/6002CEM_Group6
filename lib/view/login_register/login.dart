import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';
import '../help_center/help_center.dart';
import 'textfield.dart';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:bookbridge/view/login_register/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String loginStatusText = " ";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  checkLogin(loginStatus){ //redirect to home page if successfully logged in
    if (loginStatus == "ok"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
        key: _scaffoldKey,
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
                SizedBox(
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
                ), //text field for password
                const SizedBox(
                  height: 50,
                ),
                Text( //text for warning if fail to register
                  loginStatusText,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
                InkWell(
                  //sign in button
                  onTap: () {
                    loginStatusText = login(email.toString(), password.toString());
                    setState(() {});//hide the progress bar again if has error and stayed on this page...
                    checkLogin(loginStatusText);
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
