import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    if (ComfirmPass()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('/');
    }
  }

  void openSignUP() {
    Navigator.of(context).pushReplacementNamed('LogIn');
  }

  bool ComfirmPass() {
    if (_confirmpasswordController.text.trim() ==
        _passwordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 480,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(200),
                          image: DecorationImage(
                              image: AssetImage(
                                  'images/wallpaperflare.com_wallpaper (54).jpg'))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 20),
                      child: Container(
                        height: 55,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 101, 101, 101),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 20),
                      child: Container(
                        height: 55,
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 101, 101, 101),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 20),
                      child: Container(
                        height: 55,
                        child: TextField(
                          controller: _confirmpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 101, 101, 101),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: signUp,
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                            child: Text(
                          'Sign UP',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(
                                -2,
                                2,
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'If you dont have account please Sign up ',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: openSignUP,
                            child: Text(
                              'Here',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
