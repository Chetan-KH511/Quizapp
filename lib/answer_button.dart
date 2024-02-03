import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.Ontap});

  final String answer;
  final void Function() Ontap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: Ontap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Color.fromARGB(255, 214, 200, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
      child: Text(answer, textAlign: TextAlign.center,),
    );
  }
}
