import 'package:epi_seguranca/view/epi/epiCrud.view.dart';
import 'package:epi_seguranca/view/epi/epiList.view.dart';
import 'package:epi_seguranca/view/funcionario/funcionarioCrud.view.dart';
import 'package:epi_seguranca/view/funcionario/funcionarioList.view.dart';
import 'package:flutter/material.dart';

class HomeController {
  static void goToFuncionario(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FuncionarioCrudView()));
  }

  static void goToEPI(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EpiCrudView()));
  }

  static void goToAtribuirEPI(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FuncionarioListView()));
  }

  static void goToRelatorios(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EpiListView()));
  }

  // static Future<bool> goToClienteCadastro(BuildContext context, {Cliente cliente}) async {
  //   return await Navigator.push(context, MaterialPageRoute(builder: (context) => ClienteCadastroPage(cliente: cliente)));
  // }
}
