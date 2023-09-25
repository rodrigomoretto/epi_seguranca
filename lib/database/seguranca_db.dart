import 'package:sqflite/sqflite.dart';

class SegurancaDB {
  final tableFuncionario = 'funcionario';
  final tableEpi = 'epi';

  Future<void> createTables(Database database) async {
    await createTableFuncionario(database);
    await createTableEpi(database);
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
}