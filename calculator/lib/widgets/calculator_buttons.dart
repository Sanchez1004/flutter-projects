import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final Color buttonColor;

  const CalculatorButton({
    super.key,
    required this.callback,
    required this.text,
    this.textSize = 28,
    this.buttonColor = const Color(0xFF545F61),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 75.0,
        height: 75.0,
        child: TextButton(
          onPressed: () => { callback(text) },
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20.0),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),),),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: textSize)
            ),
          ),
        ),
      ),
    );
  }
}