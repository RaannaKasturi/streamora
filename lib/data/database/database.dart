import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:streamora/data/database/create_database.dart';
import 'package:streamora/data/database/delete_database.dart';

part 'database.g.dart';

@riverpod
class StreamoraDatabase extends _$StreamoraDatabase {
  @override
  Future<bool> build() async {
    bool isCreated = await createDatabase();
    return isCreated;
  }

  // CREATE DATABASE
  Future<bool> createDatabase() async {
    bool isCreated = await CreateDatabase().initializeStreamoraDatabase();
    return isCreated;
  }

  // DELETE DATABASE
  Future<bool> deleteDatabase() async {
    bool isDeleted = await DeleteDatabase().deleteStreamoraDatabase();
    return isDeleted;
  }

  // GET DATABASE
  Future<sqflite.Database> getDatabase() async {
    String databasesPath = await sqflite.getDatabasesPath();
    String path = join(databasesPath, 'streamora.db');
    sqflite.Database db = await sqflite.openDatabase(path, version: 1);
    return db;
  }

  // CLOSE DATABASE
  Future<void> closeDatabase() async {
    final db = await getDatabase();
    await db.close();
  }

  // ADD VALUE TO DATABASE
  Future<bool> addToDatabase(
      {required String key, required String value}) async {
    final db = await getDatabase();
    try {
      await db.insert(
        'appData',
        {'keys': key, 'values': value},
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // UPDATE VALUE IN DATABASE
  Future<bool> updateDatabase(
      {required String key, required String value}) async {
    final db = await getDatabase();
    try {
      await db.update(
        'appData',
        {'values': value},
        where: 'keys = ?',
        whereArgs: [key],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // GET VALUE FROM DATABASE
  Future<String?> getFromDatabase(String key) async {
    final db = await getDatabase();
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'appData',
        where: 'keys = ?',
        whereArgs: [key],
      );
      if (maps.isNotEmpty) {
        return maps.first['values'] as String?;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // DELETE VALUE FROM DATABASE
  Future<bool> deleteFromDatabase(String key) async {
    final db = await getDatabase();
    try {
      await db.delete(
        'appData',
        where: 'keys = ?',
        whereArgs: [key],
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
