import 'package:flutter/material.dart';

import '../widgets/login_textfield_widget.dart';

class SignUpTextField extends StatefulWidget {
  final double top;
  TextEditingController controller1;
  TextEditingController controller2;
  Function()? reset;
  SignUpTextField({
    Key? key,
    required this.top,
    required this.controller2,
    required this.controller1,
    this.reset,
  }) : super(key: key);

  @override
  SignUpTextFieldState createState() => SignUpTextFieldState();
}

class SignUpTextFieldState extends State<SignUpTextField> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.controller1,
          labelText: 'Mail',
          prefixIcon: Icons.person,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.controller2,
          labelText: 'Password',
          prefixIcon: Icons.lock,
          isPassword: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              widget.reset!();
              // Handle forgot password logic
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userNameTextFieldWidget(TextEditingController userNameController) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: userNameController,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: 'Mail',
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.person, color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget passwordTextFieldWidget(TextEditingController passwordController) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: passwordController,
      obscureText: !_isPasswordVisible,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.lock, color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
