import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../books/book_info.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background_3.png"), fit: BoxFit.cover)),
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          iconTheme: const IconThemeData(color: darkbrown),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Card(
            elevation: 0,
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search in lower case...'),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
      ),

        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('books').where("lowercaseName", isGreaterThanOrEqualTo: name.toLowerCase())
                .where("lowercaseName", isLessThan: name.toLowerCase() + 'z').snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return GestureDetector(
                        child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                data['name'],
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookInfo(bookId: data['id'],
                                      )
                              ));
                        },
                      );
                },
              );
            }
        ),
      )
    );
  }
}