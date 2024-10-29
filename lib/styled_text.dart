
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.outputText, this.sizeText, {super.key});

  final String outputText;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 182, 143, 190),
        fontSize: sizeText
      ),          
    );
  }
}