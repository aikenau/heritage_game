import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSState {
  final bool isSpeaking;
  final bool isTTSEnabled;
  final String? doubleTappedText;

  TTSState({
    this.isSpeaking = false,
    this.isTTSEnabled = true,
    this.doubleTappedText,
  });
}

class TextToSpeechService extends StateNotifier<TTSState> {
  final FlutterTts flutterTts = FlutterTts();

  TextToSpeechService() : super(TTSState()) {
    flutterTts.setCompletionHandler(() {
      state = TTSState(
        isSpeaking: false,
        isTTSEnabled: state.isTTSEnabled,
        doubleTappedText: state.doubleTappedText,
      );

      print('completion');
    });

    flutterTts.setCancelHandler(() {
      state = TTSState(
        isSpeaking: false,
        isTTSEnabled: state.isTTSEnabled,
        doubleTappedText: state.doubleTappedText,
      );

      print('Cancel');
    });

    flutterTts.setErrorHandler((message) {
      state = TTSState(
        isSpeaking: false,
        isTTSEnabled: state.isTTSEnabled,
        doubleTappedText: state.doubleTappedText,
      );

      print('Error!');
    });
  }

  Future<void> speak(String text) async {
    if (!state.isTTSEnabled) return;

    state = TTSState(
        isSpeaking: true,
        isTTSEnabled: state.isTTSEnabled,
        doubleTappedText: text);

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVoice({"name": "Kate", "locale": "en-GB"});
    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
    state = TTSState(isSpeaking: false, isTTSEnabled: state.isTTSEnabled);
  }

  void toggleTTSEnabled() {
    state = TTSState(
        isSpeaking: state.isSpeaking,
        isTTSEnabled: !state.isTTSEnabled,
        doubleTappedText: state.doubleTappedText);
    if (state.isSpeaking) stop();
  }
}

final ttsServiceProvider =
    StateNotifierProvider<TextToSpeechService, TTSState>((ref) {
  return TextToSpeechService();
});
