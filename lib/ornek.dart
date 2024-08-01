import 'package:flutter/material.dart';

List<String> todo = ["flutter", "java", "python", "dart"];

class Ornek extends StatelessWidget {
  const Ornek({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return  Card(child: Text(todo[index]));
          },
        )),
      ),
    );
  }
}
