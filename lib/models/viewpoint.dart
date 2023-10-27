import 'package:heritage_game/models/paragraph.dart';

class Viewpoint {
  final String identifier;
  final List<Paragraph> description;

  const Viewpoint({
    required this.identifier,
    required this.description,
  });
}
