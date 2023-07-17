import 'package:flutter/material.dart';
import 'package:second_app/question_screens.dart';
import 'package:second_app/questions.dart';
import 'package:second_app/start_screens.dart';
import 'package:second_app/result_screens.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  var activeScreens = 'start-screens';
  List<String> selectedAnswer =[];

  void switchScreens( ){
    setState(() {
    activeScreens = 'questions-screens';
    });
  }

  void chooseAnswer(String answer){
      selectedAnswer.add(answer);
     if (selectedAnswer.length == questions.length){
      setState(() {
      activeScreens = 'result-screens'; 
      });
    }
  } 

  void restartQuiz(){
    setState(() {
      selectedAnswer =[];
      activeScreens = 'start-screens'; 
    });
  }
  @override
  Widget build(context){ 
    Widget screensWidget = StartScreen(switchScreens);
    if (activeScreens == 'questions-screens'){
        screensWidget = QuestionScreens(chooseAnswer);
    }else if (activeScreens == 'result-screens'){
        screensWidget = ResultScreens(chosenAnswer: selectedAnswer,resetQuiz: restartQuiz);
    }
    return MaterialApp(
    home: Scaffold(
      body: 
        Container(
          decoration:const BoxDecoration(
                gradient:  LinearGradient( colors: [Color.fromARGB(255, 24, 2, 44),Color.fromARGB(255, 34, 4, 116)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                ) 
              ),
          child: screensWidget ,
        ),
  ),);
  }
}

