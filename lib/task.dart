import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  // ====api=======
  String degree = '01';
  String city_name = "Shoubra";
  String wheather = 'Cloudy';

  @override
  void initState() {
    getDegree();
    super.initState();
  }

  void getDegree() async {
    await http
        .get(Uri.parse(
            'https://api.weatherbit.io/v2.0/current?city=cairo&key=61c9593433a14f749b4414312ba63632'))
        .then((value) {
      // print(jsonDecode(value.body));

      setState(() {
        degree = jsonDecode(value.body)['data'][0]['temp'].toString();
        city_name = jsonDecode(value.body)['data'][0]['city_name'].toString();
        wheather = jsonDecode(value.body)['data'][0]['weather']['description']
            .toString();
      });
    });
  }

  //  =====end api======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 50, 152, 255),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        card('$city_name', Colors.white, 35),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.settings_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  card('$degree°', Colors.white, 100),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: card('$wheather', Colors.white, 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: card('20/12', Colors.white, 20),
                  ),
                ],
              ),
              Container(
                height: 170,
                width: 170,
                child: Image(
                  image: AssetImage(
                      'images/WhatsApp Image 2024-07-18 at 10.54.27_b29f5688.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      card2('To day', '20/12'),
                      card2('Tomorrow', '21/12'),
                      card2('Monday', '22/12'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget card(
    String name,
    Color color,
    double size,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              color: color, fontSize: size, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Widget card2(
    String name1,
    String name2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.cloud,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name1,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        Text(
          name2,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
