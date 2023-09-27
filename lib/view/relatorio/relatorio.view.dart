import 'package:epi_seguranca/controller/relatorio.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class RelatorioView extends StatelessWidget {
  const RelatorioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Logo(),
            CustomButton(
              texto: RelatorioConstants.funcionariosCadastrados,
              funcao: () => RelatorioController.goToFuncionariosCadastrados(context),
            ),
            CustomButton(
              texto: RelatorioConstants.episCadastrados,
              funcao: () => RelatorioController.goToEPIsCadastrados(context),
            ),
          ],
        ),
      ),
    );
  }
}