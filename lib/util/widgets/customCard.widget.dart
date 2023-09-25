import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String texto;
  final IconData icone;
  final Function()? funcao;
  
  const CustomCard({required this.texto, required this.icone, this.funcao, super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    BorderRadius border = const BorderRadius.all(Radius.circular(10));
    return InkWell(
      borderRadius: border,
      onTap: widget.funcao,
      child: Card(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).width > 450
            ? MediaQuery.sizeOf(context).width / 5
            : MediaQuery.sizeOf(context).width / 3,
          width: MediaQuery.sizeOf(context).width > 450
            ? MediaQuery.sizeOf(context).width / 5
            : MediaQuery.sizeOf(context).width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icone,
                size: 100,
              ),
              Text(
                widget.texto,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}