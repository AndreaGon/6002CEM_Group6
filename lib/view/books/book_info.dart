import 'package:bookbridge/view/books/widgets/chat_button.dart';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../res/colors.dart';
import '../../view_model/bookinfo_viewmodel.dart';
import '../../view_model/inbox_view_model.dart';
import '../home/homepage.dart';
import '../home/side_navi.dart';
import '../inbox/chat.dart';
import '../inbox/inbox.dart';

class BookInfo extends StatelessWidget{
  //get book info view model
  BookInfoVM bookinfoVM = BookInfoVM();
  InboxVM inboxVM = InboxVM();
  LoginVM loginVM = LoginVM();

  //book id that passed from previous page: home page or search
  BookInfo({super.key, required this.bookId, required this.uploadedBy});
  final String bookId;
  final String uploadedBy;

  @override
  Widget build(BuildContext context) {



    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //background image
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

                    //Page title
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

                    //Show book info card
                    FutureBuilder(
                      //use book id to get doc info
                      future: bookinfoVM.getBookInfo(bookId),
                      builder: (context, AsyncSnapshot documentSnapshot) {
                        if (documentSnapshot.data == null) {
                          return Container();
                        }
                        //map data into book model
                        Map<String, dynamic> bookModel = documentSnapshot.data;
                        return Expanded(
                            child: ListView.builder(
                                itemCount: 1,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  //combine two image urls
                                  final imageFutureUrls = [bookinfoVM.getImageUrl(bookModel['book_cover']), bookinfoVM.getImageUrl(bookModel['other_img'])];
                                  return Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child:Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              height: 330,
                                              //show images
                                              child: buildImageSlider(imageFutureUrls),
                                            ),

                                            //book name
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Book Name: "+ bookModel['name'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),

                                            SizedBox(height: 10),

                                            //book price
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Book Price: RM "+ bookModel['price'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),

                                            SizedBox(height: 10),

                                            //book author
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Author: "+bookModel['author'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),

                                            SizedBox(height: 10),

                                            //book published year
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  child: Text("Published year: "+ bookModel['published_year'], style: TextStyle(fontSize: 16))
                                              ),
                                            ),

                                            SizedBox(height: 10),

                                            //book summary
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                                  child: Text("Summary: "+bookModel['summary'], style: TextStyle(fontSize: 14))
                                              ),
                                            ),

                                            const SizedBox(height: 10),

                                            //user info card
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
                                                            child: Text("Uploaded by: ", style: TextStyle(fontSize: 16))
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

                                                      ChatButton(bookModel: bookModel, uploadedBy: uploadedBy)

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

    //get urls and map data to show in image slider
  Widget buildImageSlider(List<Future<String>> imageFutureUrls) {
    return FutureBuilder<List<String>>(
      //wait for all futures to complete
      future: Future.wait(imageFutureUrls),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading images');
        } else if (!snapshot.hasData) {
          return Text('No images found');
        }

        final imageUrls = snapshot.data!; // Extract the list of image URLs

        return CarouselSlider(
          options: CarouselOptions(
            height: 300,
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