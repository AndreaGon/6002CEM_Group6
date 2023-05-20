import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/books/book_info.dart';
import 'package:bookbridge/view/books/my_books.dart';
import 'package:bookbridge/view/help_center/help_center.dart';
import 'package:bookbridge/view/home/side_navi.dart';
import 'package:bookbridge/view/inbox/inbox.dart';
import 'package:bookbridge/view_model/allbooks_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final BookCoverRef = FirebaseStorage.instance.ref().child('BookCover');

  final AllBooksVM AllBooksViewModel = AllBooksVM();
  final allbookslist = AllBooksVM().getAllBooks();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_3.png"), fit: BoxFit.cover),
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
            drawer: SideNavi(),
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
                      child: const Text("Home",
                          style: TextStyle(height: 2, fontSize: 30, color: darkbrown, fontWeight: FontWeight.bold)),
                    ),
                  ),
                //Search box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),

                    child: TextField(
                      // controller: _searchController,
                      decoration: InputDecoration(hintText: 'Search...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),

                        //Search button
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: (){}, //=> _searchController(),
                        ),
                      ),
                    ),
                  ),
                ),
                //Card list

                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('books').orderBy('datetime', descending: true).snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  return Expanded(child: ListView.builder(
                    padding: const EdgeInsets.all(8),

                    itemCount: streamSnapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) =>

                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              children: [
                                //Book cover

                                Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 330,
                                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/book_cover.png")))
                                    )
                                ),

                                //Book name and price
                                ListTile(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => BookInfo()));
                                  },
                                  title: Text(streamSnapshot.data?.docs[index]['name']),
                                  subtitle: Text('RM'+ streamSnapshot.data?.docs[index]['price']),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                )
                              ]
                          )
                      )

                  )
                  );
                }
                )]
            )
        )
        )
    );
  }
}


