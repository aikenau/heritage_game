enum Activation {
  checkin,
  quiz,
}

class GameCard {
  final String identifier;
  final Activation method;
  bool isCollected;
  String? siteName;

  GameCard({
    required this.identifier,
    required this.method,
    this.isCollected = false,
    this.siteName,
  });
}
