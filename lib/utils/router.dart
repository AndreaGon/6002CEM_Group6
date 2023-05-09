import 'package:bookbridge/view/help_center/help_center.dart';
import 'package:bookbridge/view/home/homepage.dart';
import 'package:flutter/material.dart';

//import 'package:bookbridge/view/help_center/help_center.dart';


class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/homepage':
        return MaterialPageRoute(builder: (_)=> HomePage());
      default:
        return MaterialPageRoute(builder: (_)=> HomePage());
    }
  }
}