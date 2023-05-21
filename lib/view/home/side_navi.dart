import 'package:bookbridge/view/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../books/my_books.dart';
import '../help_center/help_center.dart';
import '../login_register/login.dart';
import 'homepage.dart';
import '../profile/profile.dart';

class SideNavi extends StatelessWidget {
  SideNavi({super.key});

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: const EdgeInsets.all(0), children: [
      const DrawerHeader(
          decoration: BoxDecoration(color: white),
          //BoxDecoration
          child: Image(
              image: AssetImage("assets/applogo.png"), height: 20, width: 20)),
      ListTile(
        tileColor: darkbrown,
        leading: const Icon(Icons.person),
        iconColor: Colors.white,
        title: const Text(' Home ',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      ListTile(
        tileColor: darkbrown,
        leading: const Icon(Icons.book),
        iconColor: Colors.white,
        title: const Text(' My Books ',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyBooks()));
        },
      ),
      ListTile(
        tileColor: darkbrown,
        leading: const Icon(Icons.person_outlined),
        iconColor: Colors.white,
        title: const Text(' Profile ',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
        },
      ),
      ListTile(
          tileColor: darkbrown,
          leading: const Icon(Icons.help),
          iconColor: Colors.white,
          title: const Text(' Help ',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpCenter()));
          }),
      ListTile(
        tileColor: darkbrown,
        leading: const Icon(Icons.logout),
        iconColor: Colors.white,
        title: const Text(' Sign Out ',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onTap: () {
          logout(context);
        },
      ),
    ]));
  }

  Future logout(context) async {
    await _auth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
            (route) => false));
  }
}
