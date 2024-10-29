

import 'package:adv_basics/styled_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key, required this.eventButton});

  final VoidCallback eventButton;

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(129, 198, 123, 255),
            ),
            // Opacity - Não indicado usar pois acaba com o desempenho do aplicativo 
            // Opacity(
            //   opacity: 0.6,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 200,
            //   ),
            // ),
            const SizedBox(height: 40),
            const StyledText('Learn Flutter the fun way', 24),
            const SizedBox(height: 30),
            // OutlinedButton - botão com a borda visivel
            OutlinedButton.icon(
              onPressed: eventButton,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz')
            )
          ],
        ) 
      );
  }

}