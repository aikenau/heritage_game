import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen({
    required this.startTheQuiz,
    required this.questionSetIdenitifer,
    super.key,
  });

  final String questionSetIdenitifer;
  final void Function() startTheQuiz;

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
                    'assets/images/svg/${convertFileName(questionSetIdenitifer)}.svg'),
              )),
          const SizedBox(
            height: 50,
          ),
          Text('Start a quiz to collect this Card!'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: startTheQuiz,
            child: Text('Start'),
          ),
        ],
      ),
    );
  }
}
