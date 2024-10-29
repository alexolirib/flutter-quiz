import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];

  void resetQuiz() {
    _selectedAnswers = [];
    switchScreen();
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        screen = ResultScreen(
          chosenAnswers: _selectedAnswers,
          resetQuiz: resetQuiz,
        );
      });
    }
  }

  // primeira forma
  // late Widget screen = StartScreen(eventButton: switchScreen);
  // outra forma
  Widget? screen;
  @override
  void initState() {
    screen = StartScreen(eventButton: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      screen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 78, 41, 110)),
          child: screen,
        ),
      ),
    );
  }
}
