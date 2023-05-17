import 'package:bookbridge/view/login_register/textfield.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../help_center/help_center.dart';
import '../home/homepage.dart';
import '../inbox/inbox.dart';
import '../login_register/login.dart';
import 'my_books.dart';


class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_4.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            //top bar with side menu and chat icon
            appBar: AppBar(
                title: null,
                backgroundColor: white,
                elevation: 0,
                iconTheme: const IconThemeData(color: darkbrown),
                actions: <Widget> [
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));},
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBooks()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ]
                )
            ),
            //Page content
            body: Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                    children: [
                      //Page title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 5, color: chocolate),)
                          ),
                          child: const Text("Add Book",
                              style: TextStyle(height: 2, fontSize: 30, color: darkbrown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //Card list
                      Expanded(child: ListView(
                          children: <Widget>[
                            //Book cover
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  //Book cover
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Book Cover: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          //chat button
                                            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const AddBook())); },
                                            child: Container(
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(color: light, borderRadius: BorderRadius.circular(20)),
                                                child: Row(
                                                    children: [
                                                      Icon(Icons.add_a_photo_outlined, color: darkbrown,size: 30,),
                                                      SizedBox(width: 10),
                                                      Text("Upload", style: TextStyle(color: darkbrown, fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                                                    ]
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            ),

                            //Author
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Author: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Enter author',
                                                hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 0.0,
                                                    style: BorderStyle.none,
                                                  ),
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                              ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Published year
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Published Year: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter published year',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Book summary
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 150,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Summary: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 220,
                                          child: TextField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter summary',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Book condition
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  //Book cover
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Book Condition(optional): ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          //chat button
                                            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); },
                                            child: Container(
                                                padding: const EdgeInsets.all(20),
                                                //width: 80,
                                                decoration: BoxDecoration(color: light, borderRadius: BorderRadius.circular(20)),
                                                child: Row(
                                                    children: const [
                                                      Icon(Icons.add_a_photo_outlined, color: darkbrown,size: 30,),
                                                    ]
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            ),

                            SizedBox(height: 10,),
                          ]
                      )
                      ),

                      InkWell(
                        //Book cover upload
                          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); },
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

                            child: const Text("Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center
                            ),
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}


