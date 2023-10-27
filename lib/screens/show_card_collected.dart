import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heritage_game/providers/card_collection_providers.dart';

class ShowCardCollected extends ConsumerWidget {
  const ShowCardCollected({super.key});

  String convertFileName(String input) {
    return input.toLowerCase().replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardCollection = ref.watch(cardCollectionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards you collected'),
      ),
      body: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            for (final singleCard in cardCollection)
              Center(
                child: Container(
                  width: 130,
                  height: 200,
                  child: singleCard.isCollected
                      ? SvgPicture.asset(
                          'assets/images/svg/${convertFileName(singleCard.identifier)}.svg')
                      : SvgPicture.asset(
                          'assets/images/svg/grey/grey_${convertFileName(singleCard.identifier)}.svg'),
                ),
              )
          ]),
    );
  }
}
