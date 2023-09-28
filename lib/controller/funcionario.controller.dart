import 'package:epi_seguranca/controller/epi.controller.dart';
import 'package:epi_seguranca/controller/movimento/atribuicaoEpi.controller.dart';
import 'package:epi_seguranca/database/database_service.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/model/movimento.model.dart';
import 'package:sqflite/sqflite.dart';

class FuncionarioController {
  final DatabaseService _dataBaseService = DatabaseService();

  final table = 'funcionario';

  Future<void> createTable(Database database) async {
    await database.execute('CREATE TABLE IF NOT EXISTS $table ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT NOT NULL, '
        'departamento TEXT NOT NULL, '
        'cargo TEXT NOT NULL, '
        'observacao TEXT, '
        'cadastro TEXT NOT NULL'
      ')');
  }

  Future<int> createFuncionario({
    required String nome,
    required String departamento,
    required String cargo,
    String? observacao,
  }) async {
    final database = await _dataBaseService.database;

    return await database.rawInsert(
      'INSERT INTO $table (nome, departamento, cargo, observacao, cadastro) VALUES (?, ?, ?, ?, ?)',
      [
        nome,
        departamento,
        cargo,
        observacao,
        DateTime.now().toIso8601String()
      ],
      // Consider using miliseconds since epoch?
    );
  }

  Future<List<Funcionario>> fetchAllFuncionario() async {
    final database = await _dataBaseService.database;
    final funcionarios = await database.rawQuery('SELECT * FROM $table');

    final List<Funcionario> listaFuncionarios = funcionarios
        .map((funcionario) => Funcionario.fromSqfliteDatabase(funcionario))
        .toList();
    
    for (Funcionario func in listaFuncionarios) {
      final movimentosFuncionario = await AtribuicaoController().fetchAllMovimentoFuncionario(func.id);

      if (movimentosFuncionario.isNotEmpty) {
        func.episAtribuidos = List<Epi>.empty(growable: true);

        for (Movimento movimento in movimentosFuncionario) {
          final Epi epi = await EpiController().fetchByIdEpi(movimento.idEpi);

          func.episAtribuidos?.add(epi);
        }
      }
      
    }

    return listaFuncionarios;
  }

  Future<Funcionario> fetchByIdFuncionario(int id) async {
    final database = await _dataBaseService.database;
    final funcionario =
        await database.rawQuery('SELECT * FROM $table WHERE id = ?', [id]);

    return Funcionario.fromSqfliteDatabase(funcionario.first);
  }

  Future<int> updateFuncionario({
    required int id,
    String? nome,
    String? departamento,
    String? cargo,
    String? observacao,
  }) async {
    final database = await _dataBaseService.database;

    return await database.update(
      table,
      {
        if (nome != null) 'nome': nome,
        if (departamento != null) 'departamento': departamento,
        if (cargo != null) 'cargo': cargo,
        if (observacao != null) 'observacao': observacao,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> deleteFuncionario(int id) async {
    final database = await _dataBaseService.database;

    await database.rawDelete('DELETE FROM $table WHERE id = ?', [id]);
  }
}
