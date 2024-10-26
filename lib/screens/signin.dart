import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task6/screens/home.dart';
import 'package:task6/screens/login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();
  // Name validator
  String? _validatname(String? value) {
    if (value == null) {
      return 'please enter your name';
    }
  }

  // Email Validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value) || emailRegex == null) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateComparsionpassword(String? value) {
    if (_confirmpassController.text != _passwordController.text) {
      return 'password does not match';
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      Get.to(() => Homepage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 32, color: Color(0xff012954)),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: _validatname,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff464748)),
                        ),
                        label: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff474648),
                              fontFamily: 'InriaSans'),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            color: Color(0xff474648),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'InriaSans'),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: _validateEmail,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff464748)),
                        ),
                        label: Text(
                          'E-mail',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff474648),
                              fontFamily: 'InriaSans'),
                        ),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                            color: Color(0xff474648),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'InriaSans'),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: _validatePassword,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff464748)),
                        ),
                        label: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff474648),
                              fontFamily: 'InriaSans'),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Color(0xff474648),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'InriaSans'),
                      ),
                    ),
                    TextFormField(
                      controller: _confirmpassController,
                      validator: _validateComparsionpassword,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff464748)),
                        ),
                        label: Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff474648),
                              fontFamily: 'InriaSans'),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                            color: Color(0xff474648),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'InriaSans'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 380,
                height: 45,
                decoration: const BoxDecoration(
                    color: Color(0xff012954),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 20,
                          fontFamily: 'InriaSans'),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('if you already have account'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const Login());
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Color(0xff012954),
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
