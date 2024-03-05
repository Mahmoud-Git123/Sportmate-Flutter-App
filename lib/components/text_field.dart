import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final controller;
  final String hintText;
  //final bool showText;

  const textField({
    super.key,
    this.controller, 
    required this.hintText, 
    //required this.showText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        //showText: showText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255 , 2, 38, 63)),
            borderRadius: BorderRadius.circular(25),
            
      
          ),
          fillColor: const Color.fromARGB(255 , 230, 245, 253),
          filled: true,

          hintText: hintText,
        ),
      ),
    );
    
  }

}