import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:heritage_game/models/mc_questions.dart';
import 'package:heritage_game/screens/quiz_progress_screen.dart';
import 'package:heritage_game/screens/quiz_result_screen.dart';
import 'package:heritage_game/screens/quiz_start_screen.dart';

class QuizScreenSwitcher extends ConsumerStatefulWidget {
  const QuizScreenSwitcher({
    super.key,
    required this.questionSetIdenitifer,
    required this.refreshDetailPage,
  });

  final String questionSetIdenitifer;
  final void Function() refreshDetailPage;

  @override
  ConsumerState<QuizScreenSwitcher> createState() => _QuizScreenSwitcherState();
}

class _QuizScreenSwitcherState extends ConsumerState<QuizScreenSwitcher> {
  List<String> userChoices = [];
  Widget? activeScreen;
  List<MCQuestion>? questionSet;

  @override
  void initState() {
    questionSet = questionMapping[widget.questionSetIdenitifer]!;
    activeScreen = QuizStartScreen(
        questionSetIdenitifer: widget.questionSetIdenitifer,
        startTheQuiz: _changeScreenTo);
    super.initState();
  }

  void _changeScreenTo() {
    setState(() {
      activeScreen = QuizProgressScreen(
        questionSet: questionSet,
        processChoice: _addUserChoiceToList,
      );
    });
  }

  bool _isEndOfQuiz() {
    return userChoices.length >=
            questionMapping[widget.questionSetIdenitifer]!.length
        ? true
        : false;
  }

  void _addUserChoiceToList(String choice) {
    userChoices.add(choice);

    if (_isEndOfQuiz()) {
      setState(() {
        activeScreen = QuizResultScreen(
          chosenAnswers: userChoices,
          questionSet: questionSet,
          cardIdenitifer: widget.questionSetIdenitifer,
          refreshDetailPage: widget.refreshDetailPage,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming and collect a Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: activeScreen,
      ),
    );
  }
}
