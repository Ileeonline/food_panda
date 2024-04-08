// ignore_for_file: body_might_complete_normally_nullable, unrelated_type_equality_checks, unused_local_variable, unused_field, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/pages/login_page.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../constants/constants.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (e) => const HomePage(),
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                      halfSizedBox,
                      MyTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (confirmPasswordController.text !=
                              passwordController.text) {
                            return 'Passwords must be same';
                          }
                          return null;
                        },
                        labelText: 'Confirm Password',
                        hintText: 'Enter your confirm password',
                        obscr: true,
                        controller: confirmPasswordController,
                      ),
                    ],
                  ),
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Already have an Account ?',
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
                            builder: (e) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                halfSizedBox,
                MyButton(
                  btnText: 'Sign Up',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      createUser(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
