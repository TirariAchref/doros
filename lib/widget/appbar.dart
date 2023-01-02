import 'package:doros/pages/cart.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  var startImg, endImg, text;
  Color? endImgcolor, startImgcolor;
  Color? textcolor;

  // type Pass Compalsarry
  // Only Enter type 0 and 1
  // type 0 Means Only show Text and End Image
  // type 1 Means Show startImage,Text,EndImage
  int type;

  MyAppbar({
    super.key,
    this.startImg,
    this.endImg,
    this.text,
    this.endImgcolor,
    this.startImgcolor,
    this.textcolor,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        type == 1
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: 25,
                  height: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: MySvg(
                    width: 15,
                    height: 15,
                    imagePath: startImg ?? "",
                    color: startImgcolor ?? black,
                  ),
                ),
              )
            : Container(),
        type == 1 ? const Spacer() : Container(),
        MyText(
            color: textcolor ?? black,
            text: text ?? "",
            maxline: 1,
            fontwaight: FontWeight.w500,
            fontsize: 16,
            overflow: TextOverflow.ellipsis,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
        type == 0 ? const Spacer() : const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Cart();
                },
              ),
            );
          },
          child: Container(
            width: 25,
            height: 40,
            alignment: Alignment.centerRight,
            child: MySvg(
              width: 20,
              height: 20,
              imagePath: endImg ?? "",
              color: endImgcolor ?? black,
            ),
          ),
        ),
      ],
    );
  }
}
