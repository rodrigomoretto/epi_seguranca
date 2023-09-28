import 'package:epi_seguranca/controller/epi.controller.dart';
import 'package:epi_seguranca/database/database_service.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/movimento.model.dart';
import 'package:sqflite/sqflite.dart';

class AtribuicaoController {
  final DatabaseService _dataBaseService = DatabaseService();

  final table = 'movimento';

  Future<void> createTable(Database database) async {
    await database.execute(
      'CREATE TABLE IF NOT EXISTS $table ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'id_funcionario INTEGER NOT NULL, '
        'id_epi INTEGER NOT NULL, '
        'id_tipoMov INTEGER NOT NULL, '
        'dataMovimento TEXT NOT NULL, '
        'quantidade INTEGER NOT NULL,'
        'obs_motivo TEXT, '
        'FOREIGN KEY (id_funcionario) REFERENCES funcionario (id) ON DELETE NO ACTION ON UPDATE NO ACTION,'
        'FOREIGN KEY (id_epi) REFERENCES epi (id) ON DELETE NO ACTION ON UPDATE NO ACTION,'
        'FOREIGN KEY (id_tipoMov) REFERENCES tipo_movimento (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
      ');'
    );
  }

  Future<int> createMovimento({required Movimento movimento, required Epi epi}) async {
    final database = await _dataBaseService.database;

    await database.rawInsert(
      'INSERT INTO $table (id_funcionario, id_epi, id_tipoMov, dataMovimento, quantidade, obs_motivo) VALUES (?, ?, ?, ?, ?, ?)',
      [
        movimento.idFuncionario,
        movimento.idEpi,
        movimento.idTipoMov,
        DateTime.now().toIso8601String(),
        movimento.quantidade,
        movimento.observacaoMotivo,
      ],
      // Consider using miliseconds since epoch?
    );
    
    return await EpiController().updateEpi(
      id: epi.id,
      estoque: epi.estoque - movimento.quantidade
    );
  }

  Future<List<Movimento>> fetchAllMovimento() async {
    final database = await _dataBaseService.database;
    final movimentos = await database.rawQuery('SELECT * FROM $table');

    return movimentos
        .map((movimento) => Movimento.fromSqfliteDatabase(movimento))
        .toList();
  }

  Future<List<Movimento>> fetchAllMovimentoFuncionario(int idFuncionario) async {
    final database = await _dataBaseService.database;
    final movimentos = await database.rawQuery('SELECT * FROM $table WHERE id_funcionario = ?', [idFuncionario]);

    return movimentos
        .map((movimento) => Movimento.fromSqfliteDatabase(movimento))
        .toList();
  }

  Future<Movimento> fetchByIdMovimento(int id) async {
    final database = await _dataBaseService.database;
    final movimento =
        await database.rawQuery('SELECT * FROM $table WHERE id = ?', [id]);

    return Movimento.fromSqfliteDatabase(movimento.first);
  }

  Future<int> updateMovimento({required Movimento movimento}) async {
    final database = await _dataBaseService.database;

    return await database.update(
      table,
      {
        'id_funcionario' : movimento.idFuncionario,
        'id_epi' : movimento.idEpi,
        'id_tipoMov' : movimento.idTipoMov,
        'dataMovimento' : DateTime.now(),
        'quantidade' : movimento.quantidade,
        if (movimento.observacaoMotivo != null) 'obs_motivo': movimento.observacaoMotivo,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [movimento.id],
    );
  }

  Future<void> deleteMovimento(int id) async {
    final database = await _dataBaseService.database;

    await database.rawDelete('DELETE FROM $table WHERE id = ?', [id]);
  }
}
