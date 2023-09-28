import 'package:sqflite/sqflite.dart';

class SegurancaDB {
  final tableFuncionario = 'funcionario';
  final tableEpi = 'epi';
  final tableUsuario = 'usuario';
  final tableMovimento = 'movimento';
  final tableTipoMovimento = 'tipo_movimento';

  Future<void> createTables(Database database) async {
    await createTableFuncionario(database);
    await createTableEpi(database);
    await createTableUsuario(database);
    await createTableTipoMovimento(database);
    await createTableMovimento(database);
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
      'CREATE TABLE IF NOT EXISTS $tableUsuario ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT NOT NULL, '
        'username TEXT NOT NULL, '
        'senha TEXT NOT NULL'
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

  Future<void> createTableTipoMovimento(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $tableTipoMovimento ('
        'id INTEGER PRIMARY KEY, '
        'codigo TEXT NOT NULL, '
        'tipo INTEGER NOT NULL, '
        'descricao TEXT NOT NULL'
      ');'
    );
    // Tipo 0 -> Saída
    // Tipo 1 -> Entrada
    // Tipo 2 -> Descarte (Não há entrada)

    await database.insert(
      tableTipoMovimento,
      {
        'id': 0,
        'codigo': 'EI',
        'tipo': 1,
        'descricao': 'Entrada por inclusão',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.insert(
      tableTipoMovimento,
      {
        'id': 1,
        'codigo': 'SA',
        'tipo': 0,
        'descricao': 'Saída por atribuição',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.insert(
      tableTipoMovimento,
      {
        'id': 2,
        'codigo': 'ED',
        'tipo': 1,
        'descricao': 'Entrada por devolução',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.insert(
      tableTipoMovimento,
      {
        'id': 3,
        'codigo': 'DE',
        'tipo': 2,
        'descricao': 'Entrada para descarte',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  Future<void> createTableMovimento(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $tableMovimento ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'id_funcionario INTEGER NOT NULL, '
        'id_epi INTEGER NOT NULL, '
        'id_tipoMov INTEGER NOT NULL, '
        'dataMovimento TEXT NOT NULL, '
        'quantidade INTEGER NOT NULL,'
        'obs_motivo TEXT, '
        'FOREIGN KEY (id_funcionario) REFERENCES $tableFuncionario (id) ON DELETE NO ACTION ON UPDATE NO ACTION,'
        'FOREIGN KEY (id_epi) REFERENCES $tableEpi (id) ON DELETE NO ACTION ON UPDATE NO ACTION,'
        'FOREIGN KEY (id_tipoMov) REFERENCES $tableTipoMovimento (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
      ');'
    );
  }
}