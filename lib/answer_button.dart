import 'package:flutter/material.dart';

class ButtonAnswer extends StatelessWidget{

const ButtonAnswer(this.press,this.answer,{super.key});
final void Function() press;
final String answer;

@override
Widget build(context){
  return  Container(
    margin: const  EdgeInsets.symmetric(vertical: 4,horizontal:16),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor:Colors.white,
        backgroundColor: const Color.fromARGB(118, 56, 37, 229),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      onPressed: press,
      child: Text(answer)),
  );
}
}
