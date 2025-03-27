import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/controller.dart';
import '../sign_up/sign_up.dart';
import '../sign_up/signin_page.dart';

class SignInSubmitButton extends StatefulWidget {
  Function() login;
  Function() reset;
  SignInSubmitButton({Key? key, required this.login, required this.reset})
    : super(key: key);

  @override
  SignInSubmitButtonState createState() => SignInSubmitButtonState();
}

class SignInSubmitButtonState extends State<SignInSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.login();
          },
          child: Container(
            height: 60,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text(
              'Sign In',
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Get.to(SignUpPage()),
          child: Text("Don't have an account? Sign Up"),
        ),
      ],
    );
  }
}
