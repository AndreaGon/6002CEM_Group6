import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/login_register/login.dart';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../view/help_center/help_center.dart';
import '../../view/home/homepage.dart';

class SideNavigation extends StatelessWidget {

  const SideNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(padding: const EdgeInsets.all(0), children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: white),
                //BoxDecoration
                child: Image(
                    image: AssetImage("assets/applogo.png"),
                    height: 20,
                    width: 20)),
            ListTile(
              tileColor: darkbrown,
              leading: const Icon(Icons.person),
              iconColor: Colors.white,
              title: const Text(' Home ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              tileColor: darkbrown,
              leading: const Icon(Icons.book),
              iconColor: Colors.white,
              title: const Text(' My Books ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              tileColor: darkbrown,
              leading: const Icon(Icons.person_outlined),
              iconColor: Colors.white,
              title: const Text(' Profile ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
                tileColor: darkbrown,
                leading: const Icon(Icons.help),
                iconColor: Colors.white,
                title: const Text(' Help ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenter()));
                }
            ),
            ListTile(
              tileColor: darkbrown,
              leading: const Icon(Icons.logout),
              iconColor: Colors.white,
              title: const Text(' Sign Out ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                LoginVM().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ]
          )
      ),
    );
  }
}
