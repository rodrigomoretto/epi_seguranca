import 'package:flutter/material.dart';

class CardWrapper extends StatefulWidget {
  final List<Widget> children;
  final double spacing = 30;

  const CardWrapper({required this.children, super.key});

  @override
  State<CardWrapper> createState() => _CardWrapperState();
}

class _CardWrapperState extends State<CardWrapper> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      alignment: WrapAlignment.spaceEvenly,
      spacing: widget.spacing,
      runSpacing: widget.spacing,
      children: widget.children,
    );
  }
}