import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';

import '../../models/chats_model.dart';
import '../../res/widgets/navigation.dart';
import '../../view_model/chats_viewmodel.dart';
class Chat extends StatefulWidget {
  Chat({super.key, this.chatModel});

  final Map<String, dynamic> ?chatModel;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatsVM chatsVM = ChatsVM();

  final TextEditingController _messageController = TextEditingController();

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

                        child: new Text(widget.chatModel?["chat_name"],
                            style: TextStyle(height: 1, fontSize: 20, color: darkbrown, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    // StreamBuilder(
                    //     stream: chatsVM.getAllMessages(chatModel?["id"]),
                    //     builder: (context, AsyncSnapshot snapshot){
                    //       return ListView.builder(
                    //           itemCount:  snapshot.data.docs.length,
                    //           itemBuilder: (context, index){
                    //             return Text(snapshot.data.docs[index]['message']);
                    //           },
                    //       );
                    //     }
                    // ),

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
                                        controller: _messageController,
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
                                      onPressed: () {
                                        if (_messageController.text.isNotEmpty) {
                                          Map<String, dynamic> chatMessageMap = {
                                            "message": _messageController.text,
                                            "time": DateTime.now().millisecondsSinceEpoch,
                                          };

                                          chatsVM.sendMessage(widget.chatModel?["id"], chatMessageMap);

                                          setState(() {_messageController.clear();});
                                        }

                                      },
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