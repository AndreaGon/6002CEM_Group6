import 'dart:io';
import 'package:bookbridge/view_model/login_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:bookbridge/view/inbox/widgets/rating_dialog.dart';

import '../res/colors.dart';

class ChatsVM {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  firebaseStorage.FirebaseStorage storage =
      firebaseStorage.FirebaseStorage.instance;

  final ImagePicker imagePicker = ImagePicker();
  File? chatPhotos;
  late String chatPhotoPath;

  Stream getAllMessages(String docId) {
    String fullCollection = 'chats/' + docId + '/messages';
    CollectionReference books = FirebaseFirestore.instance
        .collection(fullCollection.replaceAll(' ', ''));
    Stream<QuerySnapshot> querySnapshot =
        books.orderBy("time", descending: true).snapshots();
    return querySnapshot;
  }

  Future sendMessage(String docId, Map<String, dynamic> chatMessageData) async {
    String fullCollection = 'chats/' + docId + '/messages';
    return FirebaseFirestore.instance
        .collection(fullCollection.replaceAll(' ', ''))
        .add(chatMessageData);
  }

  Future sendMessageImage(
      String docId, Map<String, dynamic> chatMessageData) async {
    String fullCollection = 'chats/' + docId + '/messages';
    FirebaseFirestore.instance
        .collection(fullCollection.replaceAll(' ', ''))
        .add(chatMessageData)
        .then((value) => {getImage(chatMessageData["message"])});
  }

  Future<String> getImage(String imageUrl) async {
    var downloadUrl = await storage.ref().child(imageUrl).getDownloadURL();

    return await downloadUrl;
  }

  Future uploadChatPhotos(File chatPhoto) async {
    final chatPhotoPathname = basename(chatPhoto.path);
    try {
      final ref = firebaseStorage.FirebaseStorage.instance
          .ref()
          .child('ChatPhotos')
          .child(userId)
          .child(chatPhotoPathname);
      await ref.putFile(chatPhoto);
    } catch (e) {
      print('error occurred');
    }
  }

  Future getImageFromPhone(
      String docId, String sender, bool isFromCamera) async {
    var imagePicked;

    if (isFromCamera) {
      imagePicked = await imagePicker.pickImage(source: ImageSource.camera);
    } else {
      imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    }

    if (imagePicked != null) {
      chatPhotos = File(imagePicked.path);
      chatPhotoPath = basename(imagePicked!.path);

      Map<String, dynamic> chatMessageMap = {
        "message": "ChatPhotos/" + userId + "/" + chatPhotoPath,
        "sender": sender,
        "time": DateTime.now().millisecondsSinceEpoch,
        "type": "img"
      };

      await ChatsVM().uploadChatPhotos(chatPhotos!);
      await sendMessageImage(docId, chatMessageMap);
    } else {
      Fluttertoast.showToast(
        msg: "Please choose a photo to send.",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  isATextMessage(String type, String message, BuildContext context, [String? sub_name]) {
    print(message);
    if (type == "txt") {
      return new Text(message,
          style: TextStyle(height: 2, fontSize: 15, color: darkbrown));
    } else if (type == "rating") {
      //for rating automated message
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Thank you for purchasing! Please do leave a rating if you enjoyed the trading! :)",
            style: TextStyle(
              height: 2,
              fontSize: 15,
              color: darkbrown,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => RatingDialog(sub_name: sub_name!),
                );
              },
              child: Text(
                "Rate the seller!",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(left: 15, right: 15),
              backgroundColor: darkbrown, // <-- Button color
              foregroundColor: tan, // <-- Splash color
            ),
          ),
        ],
      );
    } else {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 330,
          child: FutureBuilder<String>(
              //get book cover path to download image url
              future: getImage(message),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //load image
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data ?? ""))));
                }
                return CircularProgressIndicator();
              }));
    }
  }

}
