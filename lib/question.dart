import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/qstns.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.OnselectAnswer});

  final void Function(String answer) OnselectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentquesnum = 0;

  void answerQuestion(String selectedanswer) {
    widget.OnselectAnswer(selectedanswer);
    setState(() {
      currentquesnum++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquesnum];

    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color:Colors.white,
                  fontWeight: FontWeight.bold, 
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //Deriving the answer buttons dynamically
            ...currentquestion.getShuffled().map((item) {
              return AnswerButton(
                answer: item,
                Ontap: () {
                  answerQuestion(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
