import 'package:flutter/material.dart';

class CustomListItem extends StatefulWidget {
  final List<CLayoutItem> layout;
  const CustomListItem({required this.layout, super.key});

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = _preencheLista(widget.layout);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: <Widget> [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ],
      ),
    );
  }

  List<Widget> _preencheLista(List<CLayoutItem> listaItens) {
    final List<Widget> itens = List<Widget>.empty(growable: true);

    for (CLayoutItem item in listaItens) {
      itens.add(_basic(item));
    }
    // listaItens.forEach((e) => itens.add(_basic(e)));

    return itens;
  }

  Widget _basic(CLayoutItem layout) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: layout.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: <InlineSpan> [
                  TextSpan(
                    text: layout.data,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CLayoutItem {
  final String label;
  final String data;

  CLayoutItem({required this.label, required this.data});
}