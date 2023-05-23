import 'package:bookbridge/view/books/add_book.dart';
import 'package:bookbridge/view_model/mybooks_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../help_center/help_center.dart';
import '../home/homepage.dart';
import '../home/side_navi.dart';
import '../inbox/inbox.dart';

class MyBooks extends StatelessWidget{
  const MyBooks({super.key});

  @override
  Widget build(BuildContext context) {

    final MyBooksVM mybooksVM = MyBooksVM();

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
                actions: <Widget> [
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));},
                        child: const Icon(Icons.chat_outlined),
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
                          child: const Text("My Books",
                              style: TextStyle(height: 2, fontSize: 30, color: darkbrown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //Card list

                      StreamBuilder(
                          stream: mybooksVM.getMyBooks(),
                          builder: (context,AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Expanded(child: ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> bookModel = snapshot.data?.docs[index].data();
                                  return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child:Container(
                                          width: double.infinity,
                                          //Book cover
                                          height: 150,
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              //Book cover
                                              const Image(image: AssetImage("assets/book_cover.png"),width: 120),

                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Text(bookModel['name'],
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.bold),
                                                        overflow: TextOverflow.fade,
                                                          maxLines: 1,
                                                          softWrap: false),
                                                      const SizedBox(height: 10),
                                                      Text(bookModel['author'], style: TextStyle(fontSize: 12,overflow: TextOverflow.fade)),
                                                      Text("RM"+bookModel['price'], style: TextStyle(fontSize: 12)),
                                                    ]
                                                ),
                                              ),

                                              //Delete book button
                                              Expanded(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 20),
                                                    alignment: Alignment.bottomRight,
                                                    child:InkWell(
                                                      onTap: () { },
                                                      child: const Icon(Icons.delete_forever, color: darkbrown,size: 30),
                                                    ),
                                                  )
                                              )
                                            ],
                                          )
                                      )
                                  );




                                },
                            )
                            );
                          }

                      ),

                      InkWell(
                        //chat button
                          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddBook())); },
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

                            child: const Text("Add New Book",
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
