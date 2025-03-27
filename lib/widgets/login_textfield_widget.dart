import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: widget.controller,
      obscureText: widget.isPassword && !_isPasswordVisible,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.black),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
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
