import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  late Database _database;

  Future<Database> get database async {
    // if (_database != null) {
    //   return _database;
    // }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path,
          'hadith_bn_test.db'); // Remove unnecessary path segments

      // Check if the database file exists, if not, copy it from assets
      if (!await databaseExists(path)) {
        ByteData data =
            await rootBundle.load(join('assets', 'hadith_bn_test.db'));
        List<int> bytes = data.buffer.asUint8List();
        await File(path).writeAsBytes(bytes, flush: true);
      }

      // Open the database
      Database db = await openDatabase(
        path,
        version: 1,
      );

      // Assign the local variable to the _database field
      _database = db;

      return db;
    } catch (e) {
      print('Error initializing database: $e');
      throw Exception('Error initializing database: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchData(String table) async {
    Database db = await database;
    // return await db.query(table);
    print('object');
    return await db.query(table);
  }

  // Add more methods for updating, deleting, etc., as needed
}
