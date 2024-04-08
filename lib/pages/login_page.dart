// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/components/my_button.dart';
import 'package:food_panda/components/my_textfield.dart';
import 'package:food_panda/constants/constants.dart';
import 'package:food_panda/pages/home_page.dart';
import 'package:food_panda/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInUser(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (e) => HomePage(),
        ),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              e.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              Text(
                'Food deleivery App',
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              sizedBox,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        } else {
                          null;
                        }
                      },
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      obscr: false,
                      controller: emailController,
                    ),
                    halfSizedBox,
                    MyTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 6) {
                          return 'Password must be atleast 6 characters';
                        } else {
                          null;
                        }
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscr: true,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not a member ?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (e) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              MyButton(
                btnText: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    signInUser(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
