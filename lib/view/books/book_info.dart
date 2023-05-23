import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: darkbrown,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                        child: Text("Book Info",
                            style: TextStyle(height: 2,
                                fontSize: 30,
                                color: darkbrown,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),

                    FutureBuilder(
                      future: bookinfoVM.getBookInfo(bookId),
                      builder: (context, AsyncSnapshot documentSnapshot) {
                        if (documentSnapshot.data == null) {
                          return Container();
                        }
                        Map<String, dynamic> bookModel = documentSnapshot.data;
                        return Expanded(
                            child: ListView.builder(
                                itemCount: 1,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {

                                  final imageFutureUrls = [bookinfoVM.getImageUrl(bookModel['book_cover']), bookinfoVM.getImageUrl(bookModel['other_img'])];

                                  return Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child:Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              height: 330,
                                              child: buildImageSlider(imageFutureUrls),
                                            ),

                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Book Name: "+ bookModel['name'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Book Price: RM "+ bookModel['price'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Author: "+bookModel['author'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            //Published year
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Published year: "+ bookModel['published_year'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            //Summary
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                                  child: Text("Summary: "+bookModel['summary'], style: TextStyle(fontSize: 14))
                                              ),
                                            ),
                                            const SizedBox(height: 10),

                                            Card(
                                              elevation: 5,
                                              color: white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              child:Container(
                                                padding: const EdgeInsets.all(20),
                                                child: Column(
                                                    children: [

                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                            child: Text("Uploaded by: ", style: TextStyle(fontSize: 16,))
                                                        ),
                                                      ),

                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                            child: Text("Ratings: ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
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
                                  );

                                }
                            )
                        );
                      },
                    )

                  ],
                ),
            )
        )
    );
    }

  Widget buildImageSlider(List<Future<String>> imageFutureUrls) {
    return FutureBuilder<List<String>>(
      future: Future.wait(imageFutureUrls), // Wait for all futures to complete
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator while waiting for the futures
        } else if (snapshot.hasError) {
          return Text('Error loading images'); // Handle any potential errors during image loading
        } else if (!snapshot.hasData) {
          return Text('No images found'); // Handle case when no images are available
        }

        final imageUrls = snapshot.data!; // Extract the list of image URLs from the snapshot data

        return CarouselSlider(
          options: CarouselOptions(
            height: 300,  // Replace with the desired height of the slider
            enableInfiniteScroll: true,
            autoPlay: true,
          ),
          items: imageUrls.map((imageUrl) {
            return Image.network(
              imageUrl,
              fit: BoxFit.cover,
            );
          }).toList(),
        );
      },
    );
  }


}