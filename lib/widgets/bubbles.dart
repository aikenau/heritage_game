import 'package:flutter/material.dart';
import 'package:heritage_game/models/site.dart';

class Bubbles extends StatelessWidget {
  final Site site;

  const Bubbles({
    super.key,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(site.bubbleImage),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black45,
          width: 1.0,
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  site.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
