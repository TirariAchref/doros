import 'package:doros/utils/color.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultrices tempus purus, at varius turpis dictum sed. Nulla tristique enim a augue tristique, ac sodales velit commodo. Praesent ornare orci nulla. Nullam eget lectus maximus, finibus justo vel, tincidunt dui. Morbi vulputate purus arcu, tristique rhoncus arcu imperdiet sed. Praesent turpis purus, sodales ut auctor et, accumsan sed tortor. Phasellus gravida sollicitudin ex, at lacinia nisi porta nec. Vestibulum finibus sem nibh, id hendrerit magna euismod in. Donec et vehicula nibh, lobortis lacinia orci. Integer eget libero in velit vulputate congue. Sed eros justo, rutrum eget ultricies sed, iaculis vitae.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primarydark,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: MyAppbar(
          type: 1,
          startImg: "ic_back.svg",
          startImgcolor: white,
          text: "Aboutus",
          textcolor: white,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              MyText(
                color: primarylight,
                text: "Legal Policy",
                maxline: 1,
                fontwaight: FontWeight.w600,
                fontsize: 16,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: primarylight,
                text: text,
                maxline: 10,
                fontwaight: FontWeight.w500,
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: black,
                text: "Lorem Ipsum",
                maxline: 1,
                fontwaight: FontWeight.w600,
                fontsize: 16,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: primarylight,
                text: text,
                maxline: 10,
                fontwaight: FontWeight.w500,
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: black,
                text: "Lorem Ipsum",
                maxline: 10,
                fontwaight: FontWeight.w600,
                fontsize: 16,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: primarylight,
                text: text,
                maxline: 10,
                fontwaight: FontWeight.w500,
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
              MyText(
                color: black,
                text: "Lorem Ipsum",
                maxline: 10,
                fontwaight: FontWeight.w600,
                fontsize: 16,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
              const SizedBox(height: 10),
              MyText(
                color: primarylight,
                text: text,
                maxline: 10,
                fontwaight: FontWeight.w500,
                fontsize: 12,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.left,
                fontstyle: FontStyle.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
