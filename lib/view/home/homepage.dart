import 'package:bookbridge/res/colors.dart';
import 'package:bookbridge/view/books/book_info.dart';
import 'package:bookbridge/view/home/searchbooks.dart';
import 'package:bookbridge/view/home/side_navi.dart';
import 'package:bookbridge/view/inbox/inbox.dart';
import 'package:bookbridge/view_model/allbooks_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //get all books view model
  final BooksVM booksVM = BooksVM();

  @override
  Widget build(BuildContext context) {
    return Container(
      //load background image
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_3.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,

            //top bar with side menu icon and chat icon
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
                  //Contains page title and search button
                  Container(
                    width: double.maxFinite,
                    child:  Row(
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

                        SizedBox(width: 150),

                        //Search button
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: const Icon(Icons.search, size: 40, color: tan),
                            onPressed: (){ Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CloudFirestoreSearch()
                                ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Looping of book cards
                  StreamBuilder(
                    //get books order by latest
                    stream: booksVM.getAllBooks(),
                    builder: (context, AsyncSnapshot snapshot){
                      if(!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                    return Expanded(child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount:  snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        //map data into book model
                        Map<String, dynamic> bookModel = snapshot.data?.docs[index].data();
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                                children: [
                                  //Book cover
                                  Container(
                                      padding: const EdgeInsets.all(20),
                                      height: 330,
                                      child: FutureBuilder<String>(
                                        //get book cover path to download image url
                                          future: booksVM.getImage(snapshot.data
                                              ?.docs[index]["book_cover"]),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              //load image
                                              return Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(20),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              snapshot.data ??
                                                                  "")
                                                      )
                                                  )
                                              );
                                            }
                                            return CircularProgressIndicator();
                                          }
                                      )
                                  ),

                                  //Book name and price
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              //get book id and pass to book info
                                                  BookInfo(bookId: bookModel['id'], uploadedBy: bookModel["uploaded_by"],
                                          )
                                      ));
                                    },
                                    title: Text(
                                        bookModel['name']),
                                    subtitle: Text(
                                        'RM' +
                                            bookModel['price']),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  )
                                ]
                            )
                        );
                      }
                      )
                  );
                    }
                    ),
                ]
              )
            )
        )
    );
  }
}


