import 'package:flutter/material.dart';
import 'package:second_app/questions.dart';
import 'package:second_app/sumary_quest.dart';

class ResultScreens extends StatelessWidget {
  ResultScreens({super.key, required this.chosenAnswer, required this.resetQuiz});

  final void Function() resetQuiz;
  final List<String> chosenAnswer;
  final List<Map<String, Object>> summaryList = [];

  List<Map<String, Object>>  getSummaryList () {
    for (var i = 0; i < questions.length; i++) {
      summaryList.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_question': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summaryList;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryList();
    final numCorrectAns = summaryData.where((data) {
      return data['correct_question'] == data['user_answer'];
    }).length;
    final int numAnswer = chosenAnswer.length;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered $numCorrectAns out of $numAnswer answer correctly!',
            style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 249, 133, 241),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SummaryQuest(summaryList: summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: resetQuiz ,
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text('Restart Quiz!',style: TextStyle(fontSize: 18),),
            style:TextButton.styleFrom(foregroundColor: Colors.white) ,
          )
        ]),
      ),
    );
  }
}
