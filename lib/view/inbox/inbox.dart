import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';

import '../home/side_navi.dart';
class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            drawer: const SideNavi(),
            body: new Container(
                margin: new EdgeInsets.all(15.0),
                child: new Column(
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

                    Container(
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
                      child: new Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 3, color: chocolate),)
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: new Text("Tella Lim",
                                  style: TextStyle(height: 2, fontSize: 15, color: darkbrown, fontWeight: FontWeight.bold)),
                            )
                          ),

                          new Text("Hello Christine! May I ask about the book pages and the packaging of...",
                              style: TextStyle(height: 2, fontSize: 13, color: darkbrown)),
                        ],
                      )
                    )
                  ],
                )
            )
        )
    );
  }

}