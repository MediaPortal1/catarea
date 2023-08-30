import 'package:flutter/material.dart';

class CatError extends StatelessWidget {
  const CatError({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
      width: 100,
      height: 100,
      child: Text('Ooooopss...', style: TextStyle(fontSize: 16, color: Colors.pinkAccent)));
}
