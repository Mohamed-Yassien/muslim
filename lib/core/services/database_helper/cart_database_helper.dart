import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'archived_sura_model.dart';
import 'database_constants.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), 'cartData.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database data, int version) async {
      await data.execute('''
        CREATE TABLE $tableArchived (
        $columnId INTEGER NOT NULL,
        $columnCount INTEGER NOT NULL,
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL)''');
    });
  }

  addProductToCart(ArchivedSuraModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      tableArchived,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ArchivedSuraModel>> getAllCartProducts() async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps = await dbClient.query(tableArchived);
    return maps.isNotEmpty
        ? maps.map((e) => ArchivedSuraModel.fromJson(e)).toList()
        : [];
  }

  // updateCartProduct(ArchivedSuraModel model) async {
  //   var dbClient = await database;
  //   await dbClient.update(
  //     tableArchived,
  //     model.toJson(),
  //     where: '$columnId = ? ',
  //     whereArgs: [model.productId],
  //   );
  // }

  deleteCartProduct(int productId) async {
    var dbClient = await database;
    await dbClient.delete(
      tableArchived,
      where: '$columnId = ? ',
      whereArgs: [productId],
    );
  }

  deleteAllLocaleCarts() async {
    var dbClient = await database;
    await dbClient.delete(tableArchived);
  }
}
