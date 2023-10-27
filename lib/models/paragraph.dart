import 'package:heritage_game/models/game_card.dart';

class Paragraph {
  const Paragraph({
    required this.content,
    this.imagePath,
    this.gameCard,
  });

  final String content;
  final String? imagePath;
  final GameCard? gameCard;
}
