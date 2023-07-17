import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/quiz-logo.png',width: 240,
                  color:const Color.fromARGB(120, 239, 238, 236)),
                  const SizedBox(height: 40),
                  SizedBox(height: 32,child: Text("The quiz application by flutter!",
                                style:  GoogleFonts.lato(color: Colors.white,fontSize: 20)),
                  ),
                  const SizedBox(height: 20,),
                  OutlinedButton.icon(
                  icon:const  Icon(Icons.arrow_right_alt,color: Colors.white),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.black,padding:const EdgeInsets.all(32)),
                  onPressed: startQuiz ,
                  label: const Text('Quizz !' ,
                  style:  TextStyle(color: Colors.white,fontSize: 20) ),)
                ],
            ));
  }
}
