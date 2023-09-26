import 'package:epi_seguranca/database/database_service.dart';
import 'package:epi_seguranca/model/usuario.model.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioController {
  final DatabaseService _dataBaseService = DatabaseService();

  final _table = 'usuario';

  Future<void> createTable(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $_table ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT NOT NULL, '
        'username TEXT NOT NULL, '
        'senha TEXT NOT NULL, '
        'cadastro TEXT NOT NULL'
      ');'
    );
  }

  Future<int> createUsuario({
    required String nome,
    required String username,
    required String senha,
  }) async {
    final database = await _dataBaseService.database;

    return await database.rawInsert(
      'INSERT INTO $_table (nome, username, senha, cadastro) VALUES (?, ?, ?, ?)',
      [
        nome,
        username,
        senha,
        DateTime.now().toIso8601String()
      ],
      // Consider using miliseconds since epoch?
    );
  }

  Future<List<Usuario>> fetchAllUsuario() async {
    final database = await _dataBaseService.database;
    final usuarios = await database.rawQuery('SELECT * FROM $_table');

    return usuarios.map((usuario) => Usuario.fromSqfliteDatabase(usuario)).toList();
  }

  Future<Usuario> fetchByIdUsuario(int id) async {
    final database = await _dataBaseService.database;
    final usuario = await database.rawQuery('SELECT * FROM $_table WHERE id = ?', [id]);

    return Usuario.fromSqfliteDatabase(usuario.first);
  }

  Future<Usuario?> fetchByUsernameUsuario(String username) async {
    final database = await _dataBaseService.database;
    final usuario = await database.rawQuery('SELECT * FROM $_table WHERE username = ?', [username]);

    if (usuario.length > 0) {
      return Usuario.fromSqfliteDatabase(usuario.first);
    }
    else {
      return null;
    }
  }

  Future<int> updateUsuario({
    required int id,
    String? nome,
    String? username,
    String? senha,
  }) async {
    final database = await _dataBaseService.database;

    return await database.update(
      _table,
      {
        if (nome != null) 'nome': nome,
        if (username != null) 'username': username,
        if (senha != null) 'senha': senha,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> deleteEpi(int id) async {
    final database = await _dataBaseService.database;

    await database.rawDelete('DELETE FROM $_table WHERE id = ?', [id]);
  }
}
