
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  String text;
  double? fontsize;
  var maxline,fontstyle, fontwaight,textalign;
  Color color;
  var overflow;

  MyText(
      {Key? key,
      required this.color,
      required this.text,
      this.fontsize,
      this.maxline,
      this.overflow,
      required this.textalign,
      this.fontwaight,
      required this.fontstyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      style: GoogleFonts.montserrat(
          fontSize: fontsize,
          fontStyle: fontstyle,
          color: color,
          fontWeight: fontwaight),
    );
  }
}

