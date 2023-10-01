import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  final String texto;
  final IconData? icone;
  const ScreenCard(this.texto, {this.icone, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          texto,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Visibility(
          visible: icone != null,
          child: Icon(
            icone,
            size: 50,
          ),
        ),
      ],
    );
  }
}