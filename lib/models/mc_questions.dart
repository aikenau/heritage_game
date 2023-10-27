class MCQuestion {
  MCQuestion({
    required this.question,
    required this.choices,
  });

  final String question;
  final List<String> choices;

  List<String> get shuffedChoices {
    final shuffledList = List.of(choices);
    shuffledList.shuffle();
    return shuffledList;
  }
}
