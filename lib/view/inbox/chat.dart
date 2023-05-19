import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';

import '../../res/widgets/navigation.dart';
class Chat extends StatelessWidget {
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
            drawer: SideNavigation(),
            body: new Container(
                margin: new EdgeInsets.all(15.0),
                child: new Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),

                        child: new Text("Johnny",
                            style: TextStyle(height: 1, fontSize: 20, color: darkbrown, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Mark as Sold", style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(5),
                                    backgroundColor: darkbrown, // <-- Button color
                                    foregroundColor: tan, // <-- Splash color
                                  ),
                                ),
                                ),

                                SizedBox(
                                    height: 10
                                ),

                                Row(
                                  children:[
                                    SizedBox(
                                      width: 285,
                                      child: TextFormField(

                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Send a message...",
                                          hintStyle: const TextStyle(
                                            fontSize: 17,
                                            color: lightgrey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 0.0,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),),
                                    SizedBox(
                                        width: 5
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(Icons.send, color: Colors.white),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(20),
                                        backgroundColor: darkbrown, // <-- Button color
                                        foregroundColor: tan, // <-- Splash color
                                      ),
                                    ),
                                  ]
                                )

                              ]
                          )
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }

}