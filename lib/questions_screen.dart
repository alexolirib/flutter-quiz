

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }


}

class _QuestionsScreenState extends State<QuestionsScreen> {

  // _QuestionsScreenState({this.onSelectAnswer});

  // void Functions(String answer) onSelectAnswer;


  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
      
    });
    // mesma coisa
    // currentQuestionIndex++
  }
  
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // alternativa para usar todo o espeaço
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // se esticar no total da tela
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center, 
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 204, 150, 234),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            // para adicionar os valores da nova lista na lista pai 
            // shuffle embaralha a lista
            ...currentQuestion.getShuffledAnswes().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                }
              );
        
            }),
          ],
        ),
      ),
    );
  }

}