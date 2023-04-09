import 'package:flutter/material.dart';

class DecoraitedContainer extends StatelessWidget {
  final Widget child;
  const DecoraitedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
