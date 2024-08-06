import 'package:flutter/material.dart';
import 'package:project_test/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialiser les contrôleurs ici
    final emailController = TextEditingController();
    final mdpController = TextEditingController();

    return MaterialApp(
      title: '3D Avatar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Passer les contrôleurs au widget
      home: MyWidget(email: emailController, mdp: mdpController),
    );
  }
}
