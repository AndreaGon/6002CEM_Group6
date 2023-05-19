import 'dart:convert';

import 'package:bookbridge/models/chats_model.dart';
import 'package:bookbridge/view/inbox/chat.dart';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';

import '../../models/chats_model.dart';
import '../../res/widgets/navigation.dart';
import '../../view_model/inbox_view_model.dart';
class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    InboxVM inboxVM = InboxVM();

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_5.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                title: null,
                backgroundColor: white,
                elevation: 0,
                iconTheme: IconThemeData(color: darkbrown),
                actions: <Widget> [
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        child: Icon(Icons.chat_outlined,),
                      )
                  ),
                ]
            ),
            drawer: SideNavigation(),
            body: Container(
                margin: new EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 5, color: chocolate),)
                        ),
                        child: new Text("Inbox",
                            style: TextStyle(height: 2, fontSize: 30, color: darkbrown, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    FutureBuilder(
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container();
                          }
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> chatModel = snapshot.data?.docs[index].data();
                              return Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: new InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(chatModel: chatModel)));
                                    },
                                    child: new Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(width: 3, color: chocolate),)
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(chatModel["chat_name"],
                                                  style: TextStyle(height: 2, fontSize: 15, color: darkbrown, fontWeight: FontWeight.bold)),
                                            )
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: new Text(chatModel["recent_message"],
                                              style: TextStyle(height: 2, fontSize: 13, color: darkbrown)),
                                        )

                                      ],

                                    )
                                  )
                              );
                            }

                          );
                        },
                      future: inboxVM.getAllInbox()
                    )

                  ],
                )
            )
        )
    );
  }

}