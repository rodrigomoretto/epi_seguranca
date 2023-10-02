import 'package:epi_seguranca/database/database_service.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:sqflite/sqflite.dart';

class EpiController {
  final DatabaseService _dataBaseService = DatabaseService();

  final _table = 'epi';

  Future<void> createTable(Database database) async {
    await database.execute('CREATE TABLE IF NOT EXISTS $_table ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'codigo TEXT NOT NULL, '
        'descricao TEXT NOT NULL, '
        'estoque INTEGER NOT NULL, '
        'dataValidade TEXT NOT NULL, '
        'cadastro TEXT NOT NULL'
        ')');
  }

  Future<int> createEpi({
    required String codigo,
    required String descricao,
    required int estoque,
    required DateTime dataValidade,
  }) async {
    final database = await _dataBaseService.database;

    return await database.rawInsert(
      'INSERT INTO $_table (codigo, descricao, estoque, dataValidade, cadastro) VALUES (?, ?, ?, ?, ?)',
      [
        codigo,
        descricao,
        estoque,
        dataValidade.toIso8601String(),
        DateTime.now().toIso8601String()
      ],
      // Consider using miliseconds since epoch?
    );
  }

  Future<List<Epi>> fetchAllEpi() async {
    final database = await _dataBaseService.database;
    final epis = await database.rawQuery('SELECT * FROM $_table');

    return epis.map((epi) => Epi.fromSqfliteDatabase(epi)).toList();
  }

  Future<Epi> fetchByIdEpi(int id) async {
    final database = await _dataBaseService.database;
    final epi =
        await database.rawQuery('SELECT * FROM $_table WHERE id = ?', [id]);

    return Epi.fromSqfliteDatabase(epi.first);
  }

  Future<int> updateEpi({
    required int id,
    String? codigo,
    String? descricao,
    int? estoque,
    DateTime? dataValidade,
  }) async {
    final database = await _dataBaseService.database;

    return await database.update(
      _table,
      {
        if (codigo != null) 'codigo': codigo,
        if (descricao != null) 'descricao': descricao,
        if (estoque != null) 'estoque': estoque,
        if (dataValidade != null)
          'dataValidade': dataValidade.toIso8601String(),
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
