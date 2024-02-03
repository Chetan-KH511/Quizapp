import 'package:adv_basics/data/qstns.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.Restart});

  final void Function() Restart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      //loop body
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answers': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQues = questions.length;
    final numCorrectanswer = summarydata.where((data) {
      return data['user_answer'] == data['correct_answers'];
    });

    final lord = numCorrectanswer.length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $lord out of $numTotalQues vaalues',
              style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 241, 176, 176),
              fontSize:18,
             ),
            ),
            const SizedBox(height: 10),
            QuestionsSummary(summarydata),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              icon: Icon(Icons.restart_alt_rounded),
              onPressed:Restart,
              label: const Text('Restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
