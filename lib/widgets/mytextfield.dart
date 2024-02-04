import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  final bool isSecure;
  var isPassword;
  final bool isEmail;
  final bool isNumber;
  final bool isMultiline;
  final TextEditingController controller;
  final String hint;
  final maxLength;
  final maxLines;
  final validation;
  IconData icon;
  var onChanged;

  MyTextField({super.key,
    this.isPassword = false,
    this.isEmail = false,
    this.isNumber = false,
    this.isMultiline = false,
    this.isSecure = false,
    required this.controller,
    this.hint = "",
    this.maxLength,
    this.maxLines = 1,
    required this.validation,
    required this.icon,
    this.onChanged});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: TextFormField(
        maxLines: widget.maxLines,
        validator: widget.validation,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        controller: widget.controller,
        obscureText: widget.isPassword,
        keyboardType: widget.isEmail
            ? TextInputType.emailAddress
            : (widget.isNumber
            ? TextInputType.number
            : (widget.isMultiline
            ? TextInputType.multiline
            : TextInputType.text)),
        decoration: InputDecoration(
          filled: true,
          labelText: widget.hint,
          suffixIcon: widget.isSecure
              ? GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: Icon(
              widget.isPassword ? Icons.visibility_off : Icons.visibility,
            ),
          )
              : null,
          prefixIcon: widget.icon != null
              ? Icon(
            widget.icon,
          )
              : null,
          contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          hintText: widget.hint,
          hintStyle: const TextStyle(

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1),
          ),
            floatingLabelBehavior: FloatingLabelBehavior.auto
        ),
      ),
    );
  }
}
