class Quizquestion {

  const Quizquestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffled(){
    //.of creates a new list based on the existing one 
    //.shuffle shuffles the given list 
    final shuffledvar =  List.of(answers);
    shuffledvar.shuffle();
    return shuffledvar;
}
}