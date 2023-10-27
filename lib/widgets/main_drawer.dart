import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: const DecorationImage(
                opacity: 0.3,
                fit: BoxFit.cover,
                image: AssetImage('assets/drawer_icon.jpeg'),
              ),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.castle_sharp,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Quarry Bank',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 40,
            ),
            title: const Text('Home'),
            onTap: () {
              onSelectScreen('Home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.collections,
              size: 40,
            ),
            title: const Text('Card Collection'),
            onTap: () {
              onSelectScreen('CardCollection');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.map,
              size: 40,
            ),
            title: const Text('Map'),
            onTap: () {
              onSelectScreen('Map');
            },
          ),
        ],
      ),
    );
  }
}
