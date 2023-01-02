import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBtn extends StatelessWidget {
  var width;
  var height;
  var borderRadius,
      borderWidth,
      borderColor,
      textColor,
      btnTitle,
      textalign,
      maxline,
      overflow,
      fontwaight,
      fontstyle,
      fontsize;

  Color? containerColor;

  MyBtn({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.borderWidth,
    this.containerColor,
    this.borderColor,
    this.textColor,
    this.btnTitle,
    this.textalign,
    this.fontwaight,
    this.maxline,
    this.fontsize,
    this.fontstyle,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: borderWidth, color: borderColor)),
        child: MyText(
          color: textColor,
          text: btnTitle,
          textalign: textalign,
          fontsize: fontsize,
          maxline: maxline,
          overflow: overflow,
          fontwaight: fontwaight,
          fontstyle: fontstyle,
        ));
  }
}
