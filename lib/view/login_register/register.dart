import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';
import '../help_center/help_center.dart';
import 'package:email_validator/email_validator.dart';

import '../../view_model/register_viewmodel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _loading = false;
  final registerFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  String? _genderController;
  final TextEditingController _passwordController = TextEditingController();
  String dateText = "Enter your birthdate";
  String genderText = "Select your gender";
  String registerStatusText = " ";

  handleSubmit() async {
    //function for login credential handling before going to firebase auth
    if (registerFormKey.currentState!.validate() && !_birthdateController.text.isEmpty && _genderController!=null) { //check if anything is empty
      final username = _usernameController.value.text;
      final email = _emailController.value.text;
      final birthdate = _birthdateController.value.text;
      final password = _passwordController.value.text;
      final gender = _genderController.toString();

      setState(() {
        _loading = true; //for the loading progress bar
      });

      registerStatusText = await RegisterVM().register(context, username, email, birthdate, gender, password);

      if (registerStatusText == "ok") {
        //redirect to home page... succ method, might change ltr when have time
        Navigator
            .of(context)
            .pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage()
            ));
        _loading = false;
      }else{
        setState(() {
          _loading = false; //for the loading progress bar
        });
      }
    }
    else{
      setState(() {
        registerStatusText = "Please insert all the fields";
        _loading = false; //for the loading progress bar
      });
      return;
    }
  }

  hintTextColor(hint){ //for changing hint color
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
        body: SafeArea(
            child: Form(
              key: registerFormKey,
              child: SingleChildScrollView(
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
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _usernameController,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter your username",
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
                        ), //text field for username
                        const SizedBox(
                          //spacing
                          height: 15,
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
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050));
                            _birthdateController.text = date.toString().substring(0, 10);
                            dateText = _birthdateController.text;
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
                                      _birthdateController.text =
                                          date.toString().substring(0, 10);
                                      dateText = _birthdateController.text;
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
                            value: _genderController,
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
                              _genderController = v! as String;
                              setState(() {});
                            },
                          ),
                        ), //text field for gender
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
                              }else if(value.length < 8){
                                return 'Please enter password longer than 8 characters';
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
                        SizedBox(
                          width: 150,
                          height: 60,
                          child: ElevatedButton(
                            //sign in button
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
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ), //sign up button
                        const SizedBox(
                          //spacing
                          height: 50,
                        ),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
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
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: InkWell(
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ), //need help and sign in if got acc
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
