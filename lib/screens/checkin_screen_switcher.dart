import 'package:flutter/material.dart';
import 'package:heritage_game/screens/checkin_checking_screen.dart';
import 'package:heritage_game/screens/checkin_start_screen.dart';

class CheckInSwitcherScreen extends StatefulWidget {
  const CheckInSwitcherScreen({
    super.key,
    required this.idenitifer,
    required this.refreshDetailPage,
  });

  final String idenitifer;
  final void Function() refreshDetailPage;

  @override
  State<CheckInSwitcherScreen> createState() => _CheckInSwitcherScreenState();
}

class _CheckInSwitcherScreenState extends State<CheckInSwitcherScreen> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = CheckInStartScreen(
      idenitifer: widget.idenitifer,
      goChecking: _goToChecking,
    );
    super.initState();
  }

  void _goToChecking() {
    setState(() {
      activeScreen = CheckInCheckingScreen(
        idenitifer: widget.idenitifer,
        refreshDetailPage: widget.refreshDetailPage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming and collect a Card'),
      ),
      body: activeScreen,
    );
  }
}
