import 'package:sqflite/sqflite.dart';

class SegurancaDB {
  final tableFuncionario = 'funcionario';
  final tableEpi = 'epi';
  final tableUsuario = 'usuario';

  Future<void> createTables(Database database) async {
    await createTableFuncionario(database);
    await createTableEpi(database);
    await createTableUsuario(database);
  }

  Future<void> createTableFuncionario(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $tableFuncionario ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT NOT NULL, '
        'departamento TEXT NOT NULL, '
        'cargo TEXT NOT NULL, '
        'observacao TEXT, '
        'cadastro TEXT NOT NULL'
      ');'
    );
  }

  Future<void> createTableEpi(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $tableEpi ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'codigo TEXT NOT NULL, '
        'descricao TEXT NOT NULL, '
        'estoque INTEGER NOT NULL, '
        'dataValidade TEXT NOT NULL, '
        'cadastro TEXT NOT NULL'
      ');'
    );
  }

  Future<void> createTableUsuario(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $tableEpi ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT NOT NULL, '
        'username TEXT NOT NULL, '
        'senha TEXT NOT NULL, '
      ');'
    );

    await database.insert(
      tableUsuario,
      {
        'id': 0,
        'nome': 'Guilherme',
        'username': 'guilherme',
        'senha': '12345',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.insert(
      tableUsuario,
      {
        'id': 1,
        'nome': 'Daniel',
        'username': 'daniel',
        'senha': '54321',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}