class QuizQuestion{
  const QuizQuestion(this.text,this.answer);
  final String text;
  final List<String> answer;

  List<String> getShuffledList(){
    final shuffledListed = List.of(answer);
    shuffledListed.shuffle();
    return shuffledListed;
  }
}