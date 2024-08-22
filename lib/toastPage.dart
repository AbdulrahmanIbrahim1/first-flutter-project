import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastpage extends StatelessWidget {
  const Toastpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'test-toast',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Hello world!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 20.0,
            );
          },
          child: Text('Say Hello'),
        ),
      ),
    );
  }
}
//      01064286309
