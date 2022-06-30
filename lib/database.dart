import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:convert';
import 'package:firedart/firestore/models.dart';

//import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static String dbDir = 'null.db';
  static DocumentReference? userFB;
  static bool isopen = false;

  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE Items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        context TEXT
      )
      ''');
    await database.execute('''CREATE TABLE Types(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        context TEXT
      )
      ''');
  }

  static Future<void> deleteTables(sql.Database database) async {
    await database.execute('''DROP TABLE IF EXISTS Items''');
    await database.execute('''DROP TABLE IF EXISTS Types''');
  }

  static Future<sql.Database> db() async {
    isopen = true;
    Directory initPath = await getApplicationDocumentsDirectory();
    String path = '${initPath.path}/Atlantas/DataBases/';
    return sql.openDatabase(
      join(path, dbDir),
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String context) async {
    final db = await SQLHelper.db();

    final data = {'context': context};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createType(String context) async {
    final db = await SQLHelper.db();

    final data = {'context': context};
    final id = await db.insert('types', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getTypes() async {
    final db = await SQLHelper.db();
    return db.query('types', orderBy: "id");
  }

  //DeleteAll

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
