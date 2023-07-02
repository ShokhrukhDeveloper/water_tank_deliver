import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final String text;
  final TextStyle? styleText;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? magin;

  const CustomButton({Key? key, this.onTap, this.color, required this.text, this.styleText,  this.height, this.width, this.magin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: magin,
        width: width?? double.infinity,
        height: height??56,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color:color?? const Color(0xff0074B4)
        ),
        child:  Center(
          child: Text(text,
            style:styleText?? const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),

          ),
        ),
      ),
    );
  }
}
