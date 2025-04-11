import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DeleteDatabase {
  Future<bool> deleteStreamoraDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'streamora.db');

    try {
      deleteDatabase(path).then((_) {
        print("Database deleted successfully");
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
