import 'package:heritage_game/models/viewpoint.dart';

class Site {
  final String name;
  final String bubbleImage;
  final List<Viewpoint> viewpoints;
  Map<String, double>? location;

  Site({
    required this.name,
    required this.bubbleImage,
    required this.viewpoints,
    this.location,
  });
}
