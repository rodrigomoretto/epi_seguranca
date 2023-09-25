import 'package:epi_seguranca/database/seguranca_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();

    return _database!;
  }

  Future<String> get fullpath async {
    const String name = 'seguranca.db';
    final String path = await getDatabasesPath();

    return join(path, name);
  }

  Future<Database> _initialize() async {
    final String path = await fullpath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );

    return database;
  }

  Future<void> create(Database database, int version) async =>
      await SegurancaDB().createTables(database);
}
