import 'package:flutter/material.dart';
import 'dart:math';

class Taskwrap extends StatelessWidget {
  const Taskwrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Wrap',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    body: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children:
          List.generate(10, (index){
            return Chip(
                label: Text('item : $index',style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),),
                backgroundColor: generateRandomColor(),
            );
          }),
      ),
    );
  }
  Color generateRandomColor() {
    var random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

}
