import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tester/signin/signin_content_view.dart';
import 'package:tester/signin/signin_text_field.dart';

import '../controller/controller.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SignInContentView(
                  signup:authController.signup,
                  reset:authController.resetPassword,
                  login:authController.login,
                  controller1: authController.emailController,
                  controller2: authController.passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}







