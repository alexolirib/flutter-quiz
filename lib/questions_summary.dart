import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: ,
      height: 300,

      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                // alignment: ,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: const EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                  color: data['user_answer'] == data['correct_answer']
                      ? const Color.fromARGB(129, 30, 250, 48)
                      : const Color.fromARGB(115, 221, 20, 20),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 204, 150, 234),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(data['user_answer'] as String,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 190, 109, 233),
                          fontSize: 14,
                        )),
                    Text(data['correct_answer'] as String,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 120, 86, 182),
                          fontSize: 14,
                        )),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
