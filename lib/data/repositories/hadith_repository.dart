import 'package:hadith_app/data/models/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class HadithRepository {
  final DatabaseHelper _databaseProvider;

  HadithRepository(this._databaseProvider);

  Future<List<Map<String, dynamic>>> getHadithBooks() async {
    final db = await _databaseProvider.database;
    return await db.query('books');
  }

  Future<List<Map<String, dynamic>>> getChapters(int bookId) async {
    final db = await _databaseProvider.database;
    return await db.query('chapter', where: 'book_id = ?', whereArgs: [bookId]);
  }
}
