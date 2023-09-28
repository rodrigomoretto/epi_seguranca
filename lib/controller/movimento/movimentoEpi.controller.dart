import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/view/epi/epiList.view.dart';
import 'package:epi_seguranca/view/funcionario/funcionarioList.view.dart';
import 'package:epi_seguranca/view/movimento/atribuicaoEpi.view.dart';
import 'package:flutter/material.dart';

class MovimentoEpiController {
  static void goToAtribuirEPI(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AtribuicaoEpiView()));
  }

  static void goToEPIsCadastrados(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EpiListView()));
  }

  static Future<Epi?> goToEpiSelecao(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (context) => const EpiListView(selecao: true,)));
  }

  static Future<Funcionario?> goToFuncionarioSelecao(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (context) => const FuncionarioListView(selecao: true,)));
  }
}
