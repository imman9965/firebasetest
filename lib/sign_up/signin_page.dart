import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tester/sign_up/signin_content_view.dart';
import 'package:tester/signin/signin_content_view.dart';
import '../controller/controller.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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
              SignUpContentView(
                  signup:authController.signup,
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







