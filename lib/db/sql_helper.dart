import 'package:road_rules/model/sign.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    database.execute("""
      CREATE TABLE rules(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        desc TEXT NOT NULL,
        type TEXT NOT NULL,
        image TEXT NOT NULL
       )
      """
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "rules.db",
      version: 2,
      onCreate: (sql.Database database,int version) async {
        return createTable(database);
      }
    );
  }
  static Future<void> saveSign(Sign sign) async {
    final db = await SqlHelper.db();
    await db.insert('rules', sign.toJson(), conflictAlgorithm: ConflictAlgorithm.ignore);
  }
  static Future<List<Sign>> getAllSigns() async {
    final db = await SqlHelper.db();
    final maps = await db.query('rules',orderBy: 'id desc');
   // final maps = await db.rawQuery('SELECT * FROM rules ORDER BY id DESC');
    // 1 - usul
    // final List<Sign> list1 = [];
    // for(var map in maps) {
    //   list1.add(Sign.fromJson(map));
    // }

    // 2 - usul
    return maps.map((e) => Sign.fromJson(e)).toList();
  }
  static Future<void> deleteSign(int? id) async {
    final db = await SqlHelper.db();
    await db.delete('rules', where: "id = ?", whereArgs: ['$id']);
  }
  static Future<void> updateSign(int? id, Sign sign) async {
    final db = await SqlHelper.db();
    await db.update("rules", sign.toJson(), where: "id = ? ", whereArgs: ['$id']);
  }
  static Future<void> clear() async {
    final db = await SqlHelper.db();
    await db.query("DELETE FROM rules");
  }
  static Future<Sign?> getById(int? id) async {
    final db = await SqlHelper.db();
    final list = await db.query('rules', where: "id = ?", whereArgs: ["$id"]);
    final sign = list[0];
    return Sign.fromJson(sign);
  }
 }
