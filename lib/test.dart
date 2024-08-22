// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
          const Icon(Icons.account_circle_rounded, color: Colors.white),
          title: const Text(
            'Abdo',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            // SizedBox(width: 20,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_a_photo, color: Colors.white),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage:
                AssetImage('images/wallpaperflare.com_wallpaper (54).jpg'),
                radius: 90,
              ),
            ),
            box('Naruto', Colors.white, 40, Colors.black),
            box('010915327210', Colors.white, 25, Colors.lightBlue),
            box('naruto@konoha.com0', Colors.green, 25, Colors.purple)
          ],
        ));
  }

  Widget box(String name, Color color1, double num, Color color2) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: color2, borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        height: 100,
        child: Center(
            child: Text(
              name,
              style: TextStyle(color: color1, fontSize: num),
            )),
      ),
    );
  }
}
