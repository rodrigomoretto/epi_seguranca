import 'package:epi_seguranca/controller/movimentoEpi.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
import 'package:flutter/material.dart';

class MovimentoEpiView extends StatelessWidget {
  const MovimentoEpiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: CustomView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Logo(),
            const ScreenCard(
              MovimentoEpiConstants.atribuicaoEpi,
              icone: Icons.business,
            ),
            Column(
              children: [
                CustomButton(
                  funcao: () => MovimentoEpiController.goToAtribuirEPI(context),
                  texto: MovimentoEpiConstants.atribuirEpi,
                  height: 100,
                ),
                CustomButton(
                  funcao: () => MovimentoEpiController.goToDevolverEPI(context),
                  texto: MovimentoEpiConstants.devolucaoEpi,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}