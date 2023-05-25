import 'dart:io';

import 'package:bookbridge/view/inbox/widgets/chatreceiver_container.dart';
import 'package:bookbridge/view/inbox/widgets/chatsender_container.dart';
import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/chats_model.dart';
import '../../res/widgets/navigation.dart';
import '../../view_model/chats_viewmodel.dart';
import '../../view_model/login_viewmodel.dart';
class Chat extends StatefulWidget {
  Chat({super.key, this.chatModel, this.userModel});

  final Map<String, dynamic> ?chatModel;
  final Map<String, dynamic> ?userModel;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatsVM chatsVM = ChatsVM();

  File? chatPhotos;


  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
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
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_5.png"), fit: BoxFit.cover),
          ),
          child: new Container(
              margin: new EdgeInsets.all(15.0),
              child: new Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(15.0),

                      child: new Text(widget.chatModel?["chat_name"],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(height: 1, fontSize: 20, color: darkbrown, fontWeight: FontWeight.bold)),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: StreamBuilder(
                        stream: chatsVM.getAllMessages(widget.chatModel?["id"]),
                        builder: (context, AsyncSnapshot snapshot){
                          if(!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            itemCount:  snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if(widget.userModel?["username"] == snapshot.data.docs[index]['sender']){
                                return ChatSenderContainer(message: snapshot.data.docs?[index]["message"], type: snapshot.data.docs?[index]["type"]);
                              }
                              else{
                                return ChatReceiverContainer(message: snapshot.data.docs[index]['message'], type: snapshot.data.docs?[index]["type"], sender: snapshot.data.docs[index]['sender']);
                              }

                            },
                          );
                        }
                    )
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Mark as Sold", style: TextStyle(color: Colors.white)),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(5),
                                          backgroundColor: darkbrown, // <-- Button color
                                          foregroundColor: tan, // <-- Splash color
                                        ),
                                      ),
                                      SizedBox(
                                          width: 10
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            chatsVM.getImageFromPhone(widget.chatModel?["id"], widget.userModel?["username"]);
                                          });
                                        },
                                        child: Text("Send photo", style: TextStyle(color: Colors.white)),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(5),
                                          backgroundColor: darkbrown, // <-- Button color
                                          foregroundColor: tan, // <-- Splash color
                                        ),
                                      ),
                                    ]
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
                                        onPressed: () async {


                                          if (_messageController.text.isNotEmpty) {

                                            Map<String, dynamic> chatMessageMap = {
                                              "message": _messageController.text,
                                              "sender": widget.userModel?["username"],
                                              "time": DateTime.now().millisecondsSinceEpoch,
                                              "type": "txt"
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
                      )
                    )
                  )



                ],
              )
          )
          )
      );
  }
}