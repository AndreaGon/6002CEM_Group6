import 'package:bookbridge/view/books/add_book.dart';
import 'package:bookbridge/view/books/book_info.dart';
import 'package:bookbridge/view/books/my_books.dart';
import 'package:bookbridge/view/help_center/help_center.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';

//import 'package:bookbridge/view/help_center/help_center.dart';

import '../view/inbox/inbox.dart';


class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/helpcenter':
        return MaterialPageRoute(builder: (_)=> HelpCenter());
      case '/inbox':
        return MaterialPageRoute(builder: (_)=> Inbox());
      case '/homepage':
        return MaterialPageRoute(builder: (_)=> HomePage());
      case '/mybooks':
        return MaterialPageRoute(builder: (_)=> MyBooks());
      case '/bookinfo':
        return MaterialPageRoute(builder: (_)=> BookInfo());
      case '/addbook':
        return MaterialPageRoute(builder: (_)=> AddBook());
      default:
        return MaterialPageRoute(builder: (_)=> HomePage());
    }
  }
}