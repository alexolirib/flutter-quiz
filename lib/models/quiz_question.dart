class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  
  List<String> getShuffledAnswes() {
    final shuffledList =List.of(answers);
    // alterar a ordem 
    shuffledList.shuffle();
    return shuffledList;

  }
}