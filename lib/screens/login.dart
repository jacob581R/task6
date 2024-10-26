import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task6/screens/home.dart';
import 'package:task6/screens/signin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
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
        body: Stack(children: [
          /* Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/intro1.png'),
                fit: BoxFit.cover)),
      ),
      */
          // Container(color: const Color.fromARGB(51, 1, 41, 84)),
          SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 200),
                    padding: const EdgeInsets.fromLTRB(19, 28, 19, 72),
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: const BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff012954),
                              fontFamily: 'InriaSans'),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: _validateEmail,
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff464748)),
                                      ),
                                      label: Text(
                                        'User Name',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff474648),
                                            fontFamily: 'InriaSans'),
                                      ),
                                      hintText: 'User Name',
                                      hintStyle: TextStyle(
                                          color: Color(0xff474648),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'InriaSans'),
                                      suffixIcon:
                                          // Image.asset('assets/images/account_icon.png')
                                          Icon(
                                        Icons.person_2_outlined,
                                        color: Color(0xff474648),
                                      )),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: _validatePassword,
                                  obscureText: !isPasswordVisible,
                                  decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff464748)),
                                      ),
                                      label: const Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InriaSans',
                                          color: Color(0xff474648),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          color: Color(0xff474648),
                                          fontSize: 20,
                                          fontFamily: 'InriaSans'),
                                      suffixIcon: IconButton(
                                          color: Color(0xff4647484),
                                          onPressed: () {
                                            setState(() {
                                              isPasswordVisible =
                                                  !isPasswordVisible;
                                            });
                                          },
                                          icon: Icon(isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off))),
                                ),
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 380,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color(0xff012954),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                              onPressed: _submitForm,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 20,
                                    fontFamily: 'InriaSans'),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('if you have no account'),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const Signin());
                          },
                          child: const Text('Sign In',
                              style: TextStyle(
                                  color: Color(0xff012954),
                                  decoration: TextDecoration.underline)))
                    ],
                  )
                ],
              )),
        ]));
  }
}
