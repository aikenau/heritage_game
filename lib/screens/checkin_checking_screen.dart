import 'package:flutter/material.dart';
import 'package:heritage_game/models/game_card.dart';
import 'package:heritage_game/models/site.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/providers/card_collection_providers.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:heritage_game/services/location_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class CheckInCheckingScreen extends ConsumerStatefulWidget {
  const CheckInCheckingScreen({
    super.key,
    required this.idenitifer,
    required this.refreshDetailPage,
  });

  final String idenitifer;
  final void Function() refreshDetailPage;

  @override
  ConsumerState<CheckInCheckingScreen> createState() =>
      _CheckInCheckingScreenState();
}

class _CheckInCheckingScreenState extends ConsumerState<CheckInCheckingScreen> {
  final LocationService locationservice = LocationService();
  late SMITrigger flipCard;

  Site? site;
  Position? currentPosition;
  double? distanceInMeters;

  void _getSiteFromIdenitifer(String idenitifer) {
    GameCard selectedCard = cardCollection
        .firstWhere((singleCard) => singleCard.identifier == widget.idenitifer);

    if (selectedCard.siteName != null) {
      site = sites.firstWhere(
          (selectedSite) => selectedSite.name == selectedCard.siteName);
    } else {
      debugPrint('selectedCard Null!');
    }
  }

  @override
  void initState() {
    super.initState();
    _getSiteFromIdenitifer(widget.idenitifer);
  }

  Future<String> _checkDistanceAndNotify() async {
    const effectiveDistance = 20;

    currentPosition = await locationservice.getCurrentLocation();
    distanceInMeters =
        locationservice.calculateDistanceTwoLocation(site!, currentPosition!);

    if (distanceInMeters! < effectiveDistance) {
      ref
          .read(cardCollectionProvider.notifier)
          .cardCollected(widget.idenitifer);
      return 'YES';
    } else {
      return 'NO';
    }
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

  Widget resultWidget(String isNear) {
    if (isNear == 'YES') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 300,
            child: RiveAnimation.asset(
              'assets/rive/${convertFileName(widget.idenitifer)}.riv',
              onInit: (artboard) {
                StateMachineController controller = getRiveController(artboard);
                flipCard = controller.findSMI('show') as SMITrigger;
                flipCard.fire();
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Great! You got this card',
            style: TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SvgPicture.asset(
              'assets/images/svg/grey/grey_${convertFileName(widget.idenitifer)}.svg'),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Oh! You are not close enough!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkDistanceAndNotify(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${snapshot.error}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resultWidget(snapshot.data as String),
                Text(
                    'The distance between you and the checkpoint are ${NumberFormat("#,##0.00").format(distanceInMeters)} meters'),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.refreshDetailPage();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
