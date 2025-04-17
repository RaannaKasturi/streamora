import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreateDatabase {
  Future<bool> initializeStreamoraDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'streamora.db');
    try {
      await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS appData (
              keys TEXT PRIMARY KEY,
              data_value TEXT
            )
          ''');
        },
      );
      return true;
    } catch (e) {
      print("Database initialization error: $e");
      return false;
    }
  }
}
