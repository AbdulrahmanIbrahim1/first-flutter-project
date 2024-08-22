import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Note',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            listTile('title', 'subTitle'),
            const SizedBox(
              height: 10,
            ),
            listTile('title', 'subTitle'),
            const SizedBox(
              height: 10,
            ),
            listTile('title', 'subTitle'),
            const SizedBox(
              height: 10,
            ),
            listTile('title', 'subTitle'),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const New(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget textField(String hint) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget listTile(String title, String subTitle) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade600, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                        label: const Text('New Note'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 300,
                      color: Colors.blue.shade600,
                      child: const Text('Address'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
