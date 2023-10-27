import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/screens/interactive_map.dart';
import 'package:heritage_game/screens/viewpoint_detail.dart';
import 'package:heritage_game/screens/show_card_collected.dart';
import 'package:heritage_game/widgets/main_drawer.dart';
import 'package:heritage_game/widgets/bubbles.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  void _showScreenFromDrawerMeun(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'CardCollection') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ShowCardCollected(),
        ),
      );
    }

    if (identifier == 'Map') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const InteractiveMap(),
        ),
      );
    }
  }

  void _changeList(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Quarry Bank'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      drawer: MainDrawer(
        onSelectScreen: _showScreenFromDrawerMeun,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeFactor: 0.4,
              viewportFraction: 0.4,
              initialPage: currentPage,
              onPageChanged: (index, reason) => _changeList(index),
            ),
            items: sites.map(
              (site) {
                return Builder(
                  builder: (BuildContext context) {
                    return Bubbles(site: site);
                  },
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
                itemCount: sites[currentPage].viewpoints.length,
                itemBuilder: (context, rowIndex) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        debugPrint('currentPage : $currentPage');
                        debugPrint('rowIndex : $rowIndex');
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewpointDetailScreen(
                            pageNumber: currentPage,
                            rowNumber: rowIndex,
                            //sites: sites,
                          ),
                        ));
                      },
                      leading: const Icon(Icons.circle, size: 20),
                      title: Text(
                        sites[currentPage].viewpoints[rowIndex].identifier,
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 25),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
