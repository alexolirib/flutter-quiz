

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.resetQuiz
  });

  final List<String> chosenAnswers;
  final VoidCallback resetQuiz;
// forma de fazer get
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>>summary = [];

    for (var i = 0; i<chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = summearyData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where( (data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions ou of $numTotalQuestions questioons correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 204, 150, 234),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              icon: const Icon(
                Icons.restart_alt_rounded,
                weight: 10,
              ),
              onPressed: resetQuiz,
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 204, 150, 234)
                ),
              )
            )
          ],
        )
      ),
    );
  
  }
}