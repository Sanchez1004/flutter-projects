import 'package:calculator/widgets/calculator_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String history = "";
  String expression = "";

  void clearAll(String text) {
    setState(() {
      history = "";
      expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      expression = "";
    });
  }

  void evaluate(String text) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel contextModel = ContextModel();
    setState(() {
      history = expression;
      expression = exp.evaluate(EvaluationType.REAL, contextModel).toString();
    });
  }

  void buttonClicked(String text) {
    setState(() {
      expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                      history,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 24.0,
                              color: Color(0xFF545F61)))
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: (
                  Text(
                    expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ))
                    ,)
                  ),
                ),
              ),
              Row( // AC , C, %, /
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  CalculatorButton(
                    textSize: 20,
                    callback: clearAll,
                    text: "AC",
                    buttonColor: Colors.green,
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: clear,
                    buttonColor: Colors.red,
                    text: "C",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "%",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "/",
                  ),
                ]
              ),
              Row( // 1, 2, 3, *
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "1",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "2",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "3",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "*",
                  ),
                ],
              ),
              Row( // 4, 5, 6, -
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "4",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "5",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "6",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "-",
                  ),
                ],
              ),
              Row( // 7, 8, 9, +
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "7",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "8",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "9",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "+",
                  ),
                ],
              ),
              Row( // ., 0, 00, =
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: ".",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "0",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: buttonClicked,
                    text: "00",
                  ),
                  CalculatorButton(
                    textSize: 20,
                    callback: evaluate,
                    text: "=",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}