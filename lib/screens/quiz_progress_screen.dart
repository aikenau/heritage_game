import 'package:flutter/material.dart';
import 'package:heritage_game/models/mc_questions.dart';

class QuizProgressScreen extends StatefulWidget {
  const QuizProgressScreen({
    super.key,
    required this.processChoice,
    this.questionSet,
  });

  final void Function(String choice) processChoice;
  final List<MCQuestion>? questionSet;

  @override
  State<QuizProgressScreen> createState() => _QuizProgressScreenState();
}

class _QuizProgressScreenState extends State<QuizProgressScreen> {
  var questionIndex = 0;

  void collectUserChoicesAndProgress(String choice) {
    widget.processChoice(choice);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questionSet![questionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.question,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ...currentQuestion.shuffedChoices.map(
          (choice) => ElevatedButton(
            onPressed: () {
              collectUserChoicesAndProgress(choice);
            },
            child: Text(
              choice,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
