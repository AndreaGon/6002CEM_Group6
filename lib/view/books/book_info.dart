import 'package:flutter/material.dart';

import '../../models/books_model.dart';
import '../../res/colors.dart';
import '../../view_model/bookinfo_viewmodel.dart';
import '../help_center/help_center.dart';
import '../home/homepage.dart';
import '../home/side_navi.dart';
import '../inbox/inbox.dart';
import '../login_register/login.dart';
import 'my_books.dart';

class BookInfo extends StatelessWidget{
  BookInfoVM bookinfoVM = BookInfoVM();

  BookInfo({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
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
            drawer: SideNavi(),

            //Page content
            body: Container(
                margin: const EdgeInsets.all(15.0),
                child: FutureBuilder(
                    future: bookinfoVM.getBookInfo(bookId),
                        builder: (context, AsyncSnapshot documentSnapshot) {
                        if (documentSnapshot.data == null) {
                          return Container();
                        }
                        //Map<String, dynamic> bookModel = snapshot.data! as Map<String, dynamic>;
                        Map<String, dynamic> bookModel = documentSnapshot.data;
                        return Container(
                          child: ListView.builder(
                              itemCount: 1,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {

                                return Card(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: const EdgeInsets.all(15.0),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 5, color: chocolate),)
                                          ),
                                          child: Text(bookModel['name'] as String,
                                              style: TextStyle(height: 2,
                                                  fontSize: 30,
                                                  color: darkbrown,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),

                                      Expanded(
                                          child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              child:Column(
                                                  children: [
                                                    //Book cover
                                                    Container(
                                                      padding: const EdgeInsets.all(20),
                                                      height: 330,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(20),
                                                            image: const DecorationImage(fit:BoxFit.cover, image: AssetImage("assets/book_cover.png")),
                                                          )
                                                      ),
                                                    ),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                          child: Text("Book Price: RM "+ bookModel['price'] as String, style: TextStyle(fontSize: 16))
                                                      ),
                                                    ),

                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                          child: Text("Author: "+bookModel['author'] as String, style: TextStyle(fontSize: 16))
                                                      ),
                                                    ),

                                                    //Published year
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                          child: Text("Published year: "+ bookModel['published_year'] as String, style: TextStyle(fontSize: 16))
                                                      ),
                                                    ),

                                                    //Summary
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                                          child: Text("Summary: "+bookModel['summary'] as String, style: TextStyle(fontSize: 16))
                                                      ),
                                                    ),

                                                    const SizedBox(height: 10),

                                                    Card(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                                                                          ])
                                                                  )
                                                              )
                                                            ]
                                                        ),
                                                      ),
                                                    ),

                                                  ]
                                              )
                                          )
                                      ),
                                    ],

                                  ),

                                );




                                //}
                                //});
                              }
                          )
                        );

                        },
                      )



            )
        )
    );
  }
}