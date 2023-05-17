import 'package:flutter/material.dart';

class AddBook extends StatelessWidget{
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background_4.png"), fit: BoxFit.cover),
      ),


    );
  }
}
