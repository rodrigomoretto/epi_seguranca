import 'package:epi_seguranca/controller/epi.controller.dart';
import 'package:epi_seguranca/controller/movimentoEpi.controller.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customListItem.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EpiListView extends StatefulWidget {
  final bool selecao;
  final Funcionario? funcionario;
  const EpiListView({this.selecao = false, this.funcionario, super.key});

  @override
  State<EpiListView> createState() => _EpiListViewState();
}

class _EpiListViewState extends State<EpiListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List<Epi>>(
          future: _busca(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final List<Epi> epiList = snapshot.data!;
      
              return epiList.isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Logo(),
                        ScreenCard(EpiConstants.episCadastrados,),
                        Center(
                          child: Text(
                            EpiConstants.semEpis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                      itemCount: epiList.length,
                      itemBuilder: (context, index) {
                        final epi = epiList[index];
      
                        return ListTile(
                          title: index == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Logo(),
                                    const ScreenCard(EpiConstants.episCadastrados,),
                                    Column(
                                      children: [_item(epi)],
                                    )
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [_item(epi)],
                                ),
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }

  Future<List<Epi>> _busca() async {
    if(widget.funcionario != null) {
      return await MovimentoEpiController().fetchAllEpiFuncionario(widget.funcionario!);
    }
    else {
      return await EpiController().fetchAllEpi();
    }
  }

  Widget _item(Epi epi) {
    final dataCadastro = DateFormat.yMd().format(epi.cadastro!);
    final dataValidade = DateFormat.yMd().format(epi.dataValidade);
    return InkWell(
      onTap: () async {
        if (widget.selecao) {
          Navigator.pop(context, epi);
        }
        else {
          await EpiController.goToEpiEdicao(context, epi: epi);
          setState(() {});
        }
      },
      child: CustomListItem(layout: [
        CLayoutItem(label: '${EpiConstants.codigo}: ', data: epi.codigo),
        CLayoutItem(label: '${EpiConstants.descricao}: ', data: epi.descricao),
        widget.funcionario != null
          ? CLayoutItem(label: '${EpiConstants.quantidade}: ', data: epi.qtdFunc.toString())
          : CLayoutItem(label: '${EpiConstants.quantidade}: ', data: epi.estoque.toString()),
        CLayoutItem(label: '${EpiConstants.dataValidade}: ', data: dataValidade),
        CLayoutItem(label: '${EpiConstants.cadastro}: ', data: dataCadastro),
      ]),
    );
  }
}
