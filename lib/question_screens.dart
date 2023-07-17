import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreens extends StatefulWidget {
  const QuestionScreens(this.selectedAnswer, {super.key});
  final void Function(String answer) selectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreens();
  }
}

class _QuestionScreens extends State<QuestionScreens> {
  var currentIndexQuestion = 0;
  void changeQuestion(String answer) {
    widget.selectedAnswer(answer);
    setState(() {
      currentIndexQuestion++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndexQuestion];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Color.fromARGB(225, 137, 207, 216),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 32,
          ),
          ...currentQuestion.getShuffledList().map((answer) {
            return ButtonAnswer(() {
              changeQuestion(answer);
            }, answer);
          }),
        ],
      ),
    );
  }
}
