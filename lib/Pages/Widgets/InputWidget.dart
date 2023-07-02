import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class InputWidget extends StatefulWidget {
  final String title;
  final List<TextInputFormatter>? formatter;
  final TextEditingController? controller;
   final bool isPassword;
   InputWidget({Key? key, required this.title, this.controller,  this.isPassword=false, this.formatter}) : super(key: key);
  bool showPassword=false;
  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: widget.controller,
      obscureText: widget.showPassword,
      inputFormatters: widget.formatter,

      decoration: InputDecoration(

        suffixIcon: widget.isPassword?GestureDetector(
            onTap:()=> setState(() {
              widget.showPassword= !widget.showPassword;
            }),
            child: Icon(widget.showPassword?Icons.visibility_off_outlined:Icons.visibility)):null,
        labelText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

        )
      ),
    );
  }
}
