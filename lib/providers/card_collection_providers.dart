import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:heritage_game/models/game_card.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'cardCollection.db'),
      onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE GameCards(identifier TEXT PRIMARY KEY, method TEXT, isCollected INTEGER, siteName TEXT)');

    for (var gameCard in cardCollection) {
      await db.insert('GameCards', {
        'identifier': gameCard.identifier,
        'method': gameCard.method.toString().split('.').last,
        'isCollected': gameCard.isCollected ? 1 : 0,
        'siteName': gameCard.siteName,
      });
    }
  }, version: 1);

  return db;
}

class CardCollectionNotifier extends StateNotifier<List<GameCard>> {
  CardCollectionNotifier() : super([]) {
    loadData();
  }

  void cardCollected(String identifier) async {
    print('game card Collected!');
    for (int i = 0; i < state.length; i++) {
      if (state[i].identifier == identifier) {
        state[i].isCollected = true;
        state = [...state];

        final db = await _getDatabase();
        await db.update(
          'GameCards',
          {'isCollected': 1},
          where: 'identifier = ?',
          whereArgs: [identifier],
        );
        break;
      }
    }
  }

  Future<void> loadData() async {
    final db = await _getDatabase();
    final allGameCardsData = await db.query('GameCards');
    state = allGameCardsData.map((singleGameCardData) {
      return GameCard(
        identifier: singleGameCardData['identifier'] as String,
        method: Activation.values.firstWhere((activationMethod) =>
            activationMethod.toString().split('.').last ==
            singleGameCardData['method']),
        isCollected: singleGameCardData['isCollected'] == 1,
        siteName: singleGameCardData['siteName'] as String?,
      );
    }).toList();
  }
}

final cardCollectionProvider =
    StateNotifierProvider<CardCollectionNotifier, List<GameCard>>(
        (ref) => CardCollectionNotifier());
