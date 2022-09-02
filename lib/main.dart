import 'package:flutter/material.dart';

void main() {
  runApp(const BeerApp());
}

class BeerApp extends StatelessWidget {
  const BeerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Beer App',);
  }
}

