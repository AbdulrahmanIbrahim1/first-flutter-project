import 'package:flutter/material.dart';

class TaskLog extends StatelessWidget {
  const TaskLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            backgroundImage:
                AssetImage('images/wallpaperflare.com_wallpaper (54).jpg'),
            radius: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          textField('Username'),
          const SizedBox(height: 10),
          textField('Password'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('If you dont have account'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                  },
                  child: const Text('SignUp'))
            ],
          ),
        ]),
      ),
    ));
  }

  Widget textField(String hint) {
    return TextField(
      // controller: ,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade300),
          fillColor: Colors.blue.shade600,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none)),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          textField('Username'),
          const SizedBox(height: 10),
          textField('Phone'),
          const SizedBox(
            height: 10,
          ),
          textField('Email'),
          const SizedBox(
            height: 10,
          ),
          textField('Password'),
          const SizedBox(
            height: 10,
          ),
          textField('Confirm Password'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('SignUp'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have account'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskLog(),
                        ));
                  },
                  child: const Text('Login'))
            ],
          ),
        ]),
      ),
    ));
  }

  Widget textField(String hint) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
