import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvancedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  AdvancedText(
  this.text,
  [this.fontSize=14,this.fontWeight=FontWeight.normal,this.color=Colors.black87,]);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Nunito",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),);
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  NormalText(
      this.text,
      [this.fontSize=14]);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunitoSans(
          textStyle: Theme.of(context).textTheme.headline6,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: Colors.black87
      ),);
  }
}