import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/controller.dart';
import '../sign_up/sign_up.dart';

class SignUpSubmitButton extends StatefulWidget {
  Function() signup;
  SignUpSubmitButton({Key? key,  required this.signup, })
    : super(key: key);

  @override
  SignUpSubmitButtonState createState() => SignUpSubmitButtonState();
}

class SignUpSubmitButtonState extends State<SignUpSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.signup();
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
              'Sign Up',
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
          onPressed: () =>Get.back(),
          child: Text("Back To Login"),
        ),
      ],
    );
  }
}
