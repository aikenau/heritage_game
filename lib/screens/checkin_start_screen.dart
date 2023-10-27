import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckInStartScreen extends StatelessWidget {
  const CheckInStartScreen({
    super.key,
    required this.idenitifer,
    required this.goChecking,
  });

  final String idenitifer;
  final void Function() goChecking;

  String convertFileName(String input) {
    return input.toLowerCase().replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 200,
            child: Center(
              child: SvgPicture.asset(
                  'assets/images/svg/${convertFileName(idenitifer)}.svg'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
              'This one is check-in card, to get this. \nYou must near the location.'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: goChecking,
            child: const Text('Check-in to get this card!'),
          )
        ],
      ),
    );
  }
}
