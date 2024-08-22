import 'package:flutter/material.dart';
import 'dart:math';

class TaskGridView extends StatelessWidget {
  const TaskGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Grid View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(15, (index) {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: generateRandomColor(),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'Item: $index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
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
