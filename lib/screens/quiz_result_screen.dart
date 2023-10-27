import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heritage_game/models/mc_questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/providers/card_collection_providers.dart';
import 'package:rive/rive.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  const QuizResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.questionSet,
    required this.refreshDetailPage,
    required this.cardIdenitifer,
  });

  final List<String> chosenAnswers;
  final List<MCQuestion>? questionSet;
  final void Function() refreshDetailPage;
  final String cardIdenitifer;

  @override
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  late SMITrigger flipCard;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add({
        'userChoice': widget.chosenAnswers[i],
        'correctAnswer': widget.questionSet![i].choices[0],
      });
    }
    return summary;
  }

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'state');
    artboard.addController(controller!);
    return controller;
  }

  String convertFileName(String input) {
    return input.toLowerCase().replaceAll(' ', '');
  }

  Widget buildResultScreenSummary(BuildContext context) {
    final numCorrectQuestions = summaryData
        .where((element) => element['userChoice'] == element['correctAnswer'])
        .length;

    final percentageResult =
        (numCorrectQuestions / widget.questionSet!.length) * 100;
    Widget? resultScreenSummary;
    Widget? resultButton;
    Widget? gameCardWidget;

    if (percentageResult < 60) {
      gameCardWidget = Container(
        width: 200,
        height: 300,
        child: SvgPicture.asset(
            'assets/images/svg/grey/grey_${convertFileName(widget.cardIdenitifer)}.svg'),
      );
      resultScreenSummary = Text(
        'Sorry, you failed the quiz. Correct percentage is $percentageResult %.',
        style: const TextStyle(
          fontSize: 30,
          color: Colors.red,
        ),
      );

      resultButton = ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Go Back'),
      );
    } else {
      gameCardWidget = Container(
        width: 200,
        height: 300,
        child: RiveAnimation.asset(
          'assets/rive/${convertFileName(widget.cardIdenitifer)}.riv',
          onInit: (artboard) {
            StateMachineController controller = getRiveController(artboard);
            flipCard = controller.findSMI('show') as SMITrigger;
            flipCard.fire();
          },
        ),
      );
      resultScreenSummary = Text(
        'Congratulations, you passed! Correct percentage is $percentageResult %.',
        style: const TextStyle(
          fontSize: 30,
          color: Colors.green,
        ),
      );

      resultButton = ElevatedButton(
        onPressed: () {
          ref
              .read(cardCollectionProvider.notifier)
              .cardCollected(widget.cardIdenitifer);
          widget.refreshDetailPage();

          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pop();
          });
        },
        child: const Text('Get Card'),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gameCardWidget,
          const SizedBox(
            height: 40,
          ),
          resultScreenSummary,
          const SizedBox(
            height: 40,
          ),
          resultButton,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildResultScreenSummary(context);
  }
}
