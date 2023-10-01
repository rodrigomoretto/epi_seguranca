import 'package:epi_seguranca/controller/funcionario.controller.dart';
import 'package:epi_seguranca/model/epi.model.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customListItem.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/screenCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FuncionarioListView extends StatefulWidget {
  final bool selecao;
  const FuncionarioListView({this.selecao = false, super.key});

  @override
  State<FuncionarioListView> createState() => _FuncionarioListViewState();
}

class _FuncionarioListViewState extends State<FuncionarioListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adjust Paddings
      appBar: customAppBar,
      body: FutureBuilder<List<Funcionario>>(
        future: FuncionarioController().fetchAllFuncionario(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<Funcionario> funcionariosList = snapshot.data!;

            return funcionariosList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Logo(),
                        ScreenCard(FuncionarioConstants.funcionariosCadastrados,),
                        Center(
                          child: Text(
                            FuncionarioConstants.semFuncionarios,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemCount: funcionariosList.length,
                    itemBuilder: (context, index) {
                      final funcionario = funcionariosList[index];

                      return ListTile(
                        title: index == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Logo(),
                                  const ScreenCard(FuncionarioConstants.funcionariosCadastrados,),
                                  Column(
                                    children: [_item(funcionario)],
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [_item(funcionario)],
                              ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  Widget _item(Funcionario funcionario) {
    final List<CLayoutItem> lista = _criaLista(funcionario);
    return InkWell(
      onTap: () {
        if (widget.selecao) {
          Navigator.pop(context, funcionario);
        }
      },
      child: CustomListItem(layout: lista),
    );
  }

  List<CLayoutItem> _criaLista(Funcionario func) {
    final data = DateFormat.yMd().format(func.cadastro!);
    List<CLayoutItem> listaPersonalizada = List.empty(growable: true);

    listaPersonalizada.add(CLayoutItem(label: '${FuncionarioConstants.nome}: ', data: func.nome),);
    listaPersonalizada.add(CLayoutItem(label: '${FuncionarioConstants.cargo}: ', data: func.cargo),);
    listaPersonalizada.add(CLayoutItem(label: '${FuncionarioConstants.departamento}: ', data: func.departamento),);
    listaPersonalizada.add(CLayoutItem(label: '${FuncionarioConstants.cadastro}: ', data: data),);

    if (func.episAtribuidos != null) {
      listaPersonalizada.add(CLayoutItem(label: '${FuncionarioConstants.episAtribuidos}: ', data: ''),);

      for (Epi epi in func.episAtribuidos!) {
        listaPersonalizada.add(CLayoutItem(label: '${EpiConstants.codigo}: ', data: epi.codigo),);
        listaPersonalizada.add(CLayoutItem(label: '${EpiConstants.descricao}: ', data: epi.descricao),);
        listaPersonalizada.add(CLayoutItem(label: '${EpiConstants.quantidade}: ', data: epi.qtdFunc.toString()),);
        if (func.episAtribuidos?.last != epi){
          listaPersonalizada.add(CLayoutItem(label: '---------------------------', data: ''),);
        }
      }
    }

    return listaPersonalizada;
  }
}
