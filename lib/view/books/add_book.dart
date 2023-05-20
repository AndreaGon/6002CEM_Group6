import 'dart:io';
import 'package:bookbridge/view/home/side_navi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bookbridge/view_model/addbook_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../res/colors.dart';
import '../inbox/inbox.dart';

class AddBook extends StatefulWidget {
  AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

  File? _coverphoto;
  File? _conditionphoto;
  late String BookCover;
  late String BookCondition;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGalleryBookCover() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _coverphoto = File(pickedFile.path);
        BookCover = basename(_coverphoto!.path);
        Fluttertoast.showToast(
          msg: "Photo selected.",
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Please choose a book cover.",
          gravity: ToastGravity.BOTTOM,
        );
      }
    });
  }

  Future imgFromCameraBookCover() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _coverphoto = File(pickedFile.path);
        BookCover = basename(_coverphoto!.path);
        Fluttertoast.showToast(
          msg: "Photo selected.",
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Please choose a book cover.",
          gravity: ToastGravity.BOTTOM,
        );
      }
    });
  }

  Future imgFromGalleryBookCondition() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _conditionphoto = File(pickedFile.path);
        BookCondition = basename(_conditionphoto!.path);
        Fluttertoast.showToast(
          msg: "Photo selected.",
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Please choose a book cover.",
          gravity: ToastGravity.BOTTOM,
        );
      }
    });
  }

  Future imgFromCameraBookCondition() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _conditionphoto = File(pickedFile.path);
        BookCondition = basename(_conditionphoto!.path);
        Fluttertoast.showToast(
          msg: "Photo selected.",
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Please choose a book cover.",
          gravity: ToastGravity.BOTTOM,
        );
      }
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publishedyearController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_4.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            //top bar with side menu and chat icon
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
                        child: const Icon(Icons.chat_outlined),
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
                              border: Border(bottom: BorderSide(width: 5, color: chocolate),)
                          ),
                          child: const Text("Add Book",
                              style: TextStyle(height: 2, fontSize: 30, color: darkbrown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      //Card list
                      Expanded(child: ListView(
                          children: <Widget>[
                            //Book name
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Book Name:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: nameController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter book name',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Book cover
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  //Book cover
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Book Cover:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 10),
                                        InkWell(
                                            onTap: () { _showPickerCover(context); },
                                            child: Container(
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(color: light, borderRadius: BorderRadius.circular(20)),
                                                child: Row(
                                                    children: const [
                                                      Icon(Icons.add_a_photo_outlined, color: darkbrown,size: 30,),
                                                      SizedBox(width: 10),
                                                      Text("Upload", style: TextStyle(color: darkbrown, fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                                                    ]
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            ),

                            //Author
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Author:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: authorController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Enter author',
                                                hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 0.0,
                                                    style: BorderStyle.none,
                                                  ),
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                              ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Published year
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Published Year:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 180,
                                          child: TextField(
                                            controller: publishedyearController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter published year',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Book summary
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 150,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Summary: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: summaryController,
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter summary',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            //Book condition
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Book Condition:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 10),
                                        InkWell(
                                            onTap: () { _showPickerCondition(context); },
                                            child: Container(
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(color: light, borderRadius: BorderRadius.circular(20)),
                                                child: Row(
                                                    children: const [
                                                      Icon(Icons.add_a_photo_outlined, color: darkbrown,size: 30),
                                                    ]
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            ),

                            //Book price
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child:Container(
                                  width: double.infinity,
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                      children: [
                                        const Text('Price: RM', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: priceController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: '0',
                                              hintStyle: const TextStyle(fontSize: 16, color: lightgrey),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 0.0,
                                                  style: BorderStyle.none,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                            ),

                            const SizedBox(height: 10),
                          ]
                      )),
                      //Upload book button
                      InkWell(
                          onTap: () { uploadCheck(context); },
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

                            child: const Text("Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center
                            ),
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  uploadCheck(BuildContext context){

    String name,author,year, summary, price, bookcover, bookcondition, datetime;

    datetime = DateTime.now().toString();
    bookcondition = 'BookCondition/'+BookCondition;
    bookcover = 'BookCover/'+BookCover;
    name = nameController.text;
    author = authorController.text;
    year = publishedyearController.text;
    summary = summaryController.text;
    price = priceController.text;

    if(name == '' || author == '' || year == '' || summary == '' || price == '' || BookCover == '' || BookCondition == '')
    {
      Fluttertoast.showToast(
        msg: "Please ensure all information are filled in.",
        gravity: ToastGravity.BOTTOM,
      );
      return;
    } else{
      AddBooksVM().uploadBook(name,author,year, summary, price, bookcover, bookcondition, datetime);
      AddBooksVM().uploadBookCover(_coverphoto!);
      AddBooksVM().uploadBookCondition(_conditionphoto!);
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "Book added.",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void _showPickerCover(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGalleryBookCover();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCameraBookCover();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPickerCondition(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGalleryBookCondition();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCameraBookCondition();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}





