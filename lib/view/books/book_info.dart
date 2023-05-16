import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../help_center/help_center.dart';
import '../home/homepage.dart';
import '../inbox/inbox.dart';
import '../login_register/login.dart';
import 'my_books.dart';

class BookInfo extends StatelessWidget{
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_1.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            //top bar with side menu and chat icon
            appBar: AppBar(
                title: null,
                backgroundColor: white,
                elevation: 0,
                iconTheme: const IconThemeData(color: darkbrown),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Inbox()));
                        },
                        child: const Icon(Icons.chat_outlined,),
                      )
                  ),
                ]
            ),

            //list tile of side menu
            drawer: Drawer(
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomePage()));
                    },
                  ),
                  ListTile(
                    tileColor: darkbrown,
                    leading: const Icon(Icons.book),
                    iconColor: Colors.white,
                    title: const Text(' My Books ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyBooks()));
                    },
                  ),
                  ListTile(
                    tileColor: darkbrown,
                    leading: const Icon(Icons.person_outlined),
                    iconColor: Colors.white,
                    title: const Text(' Profile ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomePage()));
                    },
                  ),
                  ListTile(
                      tileColor: darkbrown,
                      leading: const Icon(Icons.help),
                      iconColor: Colors.white,
                      title: const Text(' Help ',
                          style: TextStyle(
                              fontSize: 20, color: Colors.white)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HelpCenter()));
                      }
                  ),
                  ListTile(
                    tileColor: darkbrown,
                    leading: const Icon(Icons.logout),
                    iconColor: Colors.white,
                    title: const Text(' Sign Out ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Login()));
                    },
                  ),
                ]
                )
            ),

            //Page content
            body: Container(
                margin: const EdgeInsets.all(15.0),
                child: ListView(
                    children: [
                      //Page title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 5, color: chocolate),)
                          ),
                          child: Text("Book Name",
                              style: TextStyle(height: 2,
                                  fontSize: 30,
                                  color: darkbrown,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Book Content
                      Expanded(
                          child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                child:Column(
                                    children: [
                                      //Book cover
                                      Container(
                                          padding: const EdgeInsets.all(20),
                                          height: 330,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/book_cover.png"),),
                                              )
                                          ),
                                      ),

                                      //Book price
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                            child: Text("Book Price: RM 12", style: TextStyle(fontSize: 16,))
                                        ),
                                      ),

                                      //Author
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                            child: Text("Author: Jane Smith", style: TextStyle(fontSize: 16,))
                                        ),
                                      ),

                                      //Published year
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                            child: Text("Published year: 1990", style: TextStyle(fontSize: 16,))
                                        ),
                                      ),

                                      //Summary
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                            child: Text("Summary: The story follows the life of 17-year-old Emily as she navigates the challenges of her final year of high school, and the difficult circumstances that arise when her family is forced to move to a small town in the middle of winter. The story follows the life of 17-year-old Emily as she navigates the challenges of her final year of high school, and the difficult circumstances that arise when her family is forced to move to a small town in the middle of winter.", style: TextStyle(fontSize: 16, ))
                                        ),
                                      ),

                                    ]
                                )
                            )
                      ),

                      SizedBox(height: 10),

                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                          child:Container(
                              padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text("Uploaded by: Christine Tan", style: TextStyle(fontSize: 16,))
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text("Ratings: 4.8", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                                ),
                              ),

                              const SizedBox(height: 20),

                              InkWell(
                                //chat button
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  width: double.maxFinite,
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

                                  child: Row(
                                    children: [
                                      Icon(Icons.chat_bubble_outline, color: Colors.white,),
                                      SizedBox(width: 100,),
                                      Text("Chat", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                    ]
                                  )
                                )
                              )
                              ]
                            ),
                          ),
                      ),
                    ]
                )
            )
        )
    );
  }
}