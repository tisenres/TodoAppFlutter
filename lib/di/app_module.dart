// For example in another file
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/todos.db";
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            deadline INTEGER,
            importance INTEGER
          )
        ''');
      },
    );
  }
}
