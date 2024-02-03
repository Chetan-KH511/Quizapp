import 'package:adv_basics/question.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start.dart';
import 'package:adv_basics/data/qstns.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void Restart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'Question-screen';
    });
  }

  void switchscreen() {
    setState(() {
      activeScreen = 'Question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = Startscreen(switchscreen);

    if (activeScreen == 'Question-screen') {
      screenWidget = QuestionScreen(OnselectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        Restart: Restart,
      );
    }
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 90, 1, 206),
                Color.fromARGB(255, 90, 1, 112)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
