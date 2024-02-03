import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.activeScreen, {super.key});

final void Function() activeScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(112, 255, 0, 0),
          ),
          const SizedBox(height: 20),
          Text(
            "Learn flutter the easy way",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
             ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
              onPressed: activeScreen,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.arrow_right_alt),
              label: const Text("Start quiz"))
        ],
      ),
    );
  }
}
