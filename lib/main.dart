import 'package:flutter/material.dart';
import 'doodle_page.dart';

void main() {
  runApp(const DoodleApp());
}

class DoodleApp extends StatelessWidget {
  const DoodleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doodle App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: DoodlePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
