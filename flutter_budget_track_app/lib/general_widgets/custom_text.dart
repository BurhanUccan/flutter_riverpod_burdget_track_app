import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;
  final Color color;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 16.0,
    this.isBold = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: null,
      overflow: TextOverflow.ellipsis,
      text,
      style: GoogleFonts.cuprum(
        color: color,
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
