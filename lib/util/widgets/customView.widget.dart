import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  final Widget? child;
  const CustomView({this.child ,super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 64,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}