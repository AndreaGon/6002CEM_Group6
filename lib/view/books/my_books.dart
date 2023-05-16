import 'package:flutter/material.dart';

class MyBooks extends StatelessWidget{
  const MyBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_2.png"), fit: BoxFit.cover),
      ),


    );
  }
}
