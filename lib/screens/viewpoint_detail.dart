import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/models/game_card.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:heritage_game/providers/tts_providers.dart';
import 'package:heritage_game/screens/checkin_screen_switcher.dart';
import 'package:heritage_game/screens/quiz_screen_switcher.dart';
import 'package:heritage_game/providers/card_collection_providers.dart';

class ViewpointDetailScreen extends ConsumerStatefulWidget {
  const ViewpointDetailScreen({
    super.key,
    required this.pageNumber,
    required this.rowNumber,
  });

  final int pageNumber;
  final int rowNumber;

  @override
  ConsumerState<ViewpointDetailScreen> createState() =>
      _ViewpointDetailScreenState();
}

class _ViewpointDetailScreenState extends ConsumerState<ViewpointDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _refreshDetailPage() {
    debugPrint('refresh detail page have been called');
    setState(() {});
  }

  bool isGameCardCollected(GameCard? gameCard) {
    if (gameCard == null) return false;

    GameCard? correspondingCard;
    try {
      correspondingCard = ref.read(cardCollectionProvider).firstWhere(
            (card) => card.identifier == gameCard.identifier,
          );
    } catch (e) {
      correspondingCard = null;
    }

    return correspondingCard?.isCollected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final ttsService = ref.read(ttsServiceProvider.notifier);
    final ttsState = ref.watch(ttsServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            sites[widget.pageNumber].viewpoints[widget.rowNumber].identifier),
        actions: [
          Tooltip(
            message: "Toggle the voice over",
            waitDuration: const Duration(milliseconds: 500),
            showDuration: const Duration(milliseconds: 1000),
            child: IconButton(
              onPressed: () {
                setState(() {
                  ttsService.toggleTTSEnabled();
                });
              },
              icon: Icon(
                  ttsState.isTTSEnabled ? Icons.volume_up : Icons.volume_off),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Double tap for voice over.'),
              const SizedBox(
                height: 20,
              ),
              for (final paragraph in sites[widget.pageNumber]
                  .viewpoints[widget.rowNumber]
                  .description) ...[
                if (paragraph.imagePath != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      paragraph.imagePath!,
                      width: double.infinity,
                    ),
                  ),
                GestureDetector(
                  onDoubleTap: ttsState.isSpeaking
                      ? () {
                          print("${ttsState.isSpeaking} I should stop");
                          ttsService.stop();
                        }
                      : () {
                          print("${ttsState.isSpeaking} Before SPEAK");
                          ttsService.speak(paragraph.content);
                          print("${ttsState.isSpeaking} After SPEAK");
                        },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (ttsState.isSpeaking &&
                                ttsState.doubleTappedText == paragraph.content
                            ? Colors.black45
                            : Colors.transparent),
                        width: 2.0,
                      ),
                    ),
                    child: Tooltip(
                      message: "Double-tap to toggle the voice over.",
                      waitDuration: const Duration(milliseconds: 500),
                      showDuration: const Duration(milliseconds: 1000),
                      child: Text(
                        paragraph.content,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                if (paragraph.gameCard != null &&
                    !isGameCardCollected(paragraph.gameCard))
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            paragraph.gameCard!.method == Activation.quiz
                                ? QuizScreenSwitcher(
                                    questionSetIdenitifer:
                                        paragraph.gameCard!.identifier,
                                    refreshDetailPage: _refreshDetailPage,
                                  )
                                : CheckInSwitcherScreen(
                                    idenitifer: paragraph.gameCard!.identifier,
                                    refreshDetailPage: _refreshDetailPage,
                                  ),
                      );
                    },
                    child: paragraph.gameCard!.method == Activation.quiz
                        ? const Text('Quiz Card')
                        : const Text('Check-in Card'),
                  ),
                const SizedBox(
                  height: 30,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
