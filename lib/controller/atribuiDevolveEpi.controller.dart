import 'package:epi_seguranca/view/epi/epiList.view.dart';
import 'package:epi_seguranca/view/funcionario/funcionarioList.view.dart';
import 'package:flutter/material.dart';

class RelatorioController {
  static void goToFuncionariosCadastrados(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FuncionarioListView()));
  }

  static void goToEPIsCadastrados(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EpiListView()));
  }
}
