import 'package:doros/pages/cart.dart';
import 'package:doros/pages/checkout.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:doros/widget/expandedlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int num = 1;
  Constant constant = Constant();

  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarylight,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: primarylight,
        title: MyAppbar(type: 1, startImg: "ic_back.svg", startImgcolor: white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: primarylight,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  parentConainer(),
                  childConainer(),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1350,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 140),
                    decoration: BoxDecoration(
                        color: primarydark,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                            color: white,
                            text: "₹ 455.00",
                            fontsize: 18,
                            fontwaight: FontWeight.w600,
                            maxline: 2,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.left,
                            fontstyle: FontStyle.normal),
                        MyText(
                            color: white,
                            text: "94 % off -12 Hours left at this price !",
                            fontsize: 12,
                            fontwaight: FontWeight.w600,
                            maxline: 2,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.left,
                            fontstyle: FontStyle.normal),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Checkout();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: primarylight,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: MyText(
                              color: white,
                              text: "BUY NOW",
                              textalign: TextAlign.center,
                              fontsize: 14,
                              maxline: 1,
                              overflow: TextOverflow.ellipsis,
                              fontwaight: FontWeight.w500,
                              fontstyle: FontStyle.normal,
                            ),
                          ),
                        ),
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
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: MyText(
                              color: primarydark,
                              text: "ADD TO CART",
                              textalign: TextAlign.center,
                              fontsize: 14,
                              maxline: 1,
                              overflow: TextOverflow.ellipsis,
                              fontwaight: FontWeight.w500,
                              fontstyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget parentConainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 650,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: primarylight,
      child: Column(
        children: [
          // videoImage
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: MyImage(
                    width: 250,
                    height: 130,
                    fit: BoxFit.fill,
                    imagePath: "demo1.png"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: Align(
                  alignment: Alignment.center,
                  child: MyImage(
                    width: 30,
                    height: 30,
                    color: white,
                    imagePath: "ic_play.png",
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyText(
                        color: white,
                        text: "Preview this course",
                        fontsize: 14,
                        fontwaight: FontWeight.w600,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          // DetailVideo Title Text
          MyText(
              color: white,
              text: "Adobe illustrator CC- Essentials Traning Course",
              fontsize: 18,
              fontwaight: FontWeight.w600,
              maxline: 2,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.left,
              fontstyle: FontStyle.normal),
          const SizedBox(height: 15),
          // video Discription
          MyText(
              color: white,
              text:
                  "Learn Adobe illustrator CC graphics design logo design abd nore with this in-depth",
              fontsize: 12,
              fontwaight: FontWeight.w400,
              maxline: 2,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.left,
              fontstyle: FontStyle.normal),
          const SizedBox(height: 15),
          //  Video Rating with Rating Count
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                color: orange,
                alignment: Alignment.center,
                child: MyText(
                    color: black,
                    text: "BESTSELLER",
                    fontsize: 10,
                    fontwaight: FontWeight.w400,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
              ),
              Container(
                width: 100,
                height: 20,
                alignment: Alignment.center,
                child: RatingBar(
                  initialRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half: MySvg(
                        width: 5, height: 5, imagePath: "ic_notRating.svg"),
                    empty: MySvg(
                      width: 5,
                      height: 5,
                      imagePath: "ic_notRating.svg",
                      color: orange,
                    ),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
              ),
              MyText(
                  color: white,
                  text: "4.7",
                  fontsize: 12,
                  fontwaight: FontWeight.w400,
                  maxline: 2,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.left,
                  fontstyle: FontStyle.normal),
              MyText(
                  color: white,
                  text: "(13,513 Ratings)",
                  fontsize: 12,
                  fontwaight: FontWeight.w400,
                  maxline: 2,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.left,
                  fontstyle: FontStyle.normal),
            ],
          ),
          const SizedBox(height: 10),
          // View  Count With Student
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            alignment: Alignment.center,
            child: Row(
              children: [
                MyImage(
                  width: 15,
                  height: 15,
                  imagePath: "ic_eye.png",
                ),
                const SizedBox(
                  width: 5,
                ),
                MyText(
                    color: white,
                    text: "51,449",
                    fontsize: 12,
                    fontwaight: FontWeight.w400,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                const SizedBox(
                  width: 5,
                ),
                MyText(
                    color: white,
                    text: "Stdents",
                    fontsize: 12,
                    fontwaight: FontWeight.w400,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
              ],
            ),
          ),
          // Created By List
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    color: white,
                    text: "Created by :",
                    fontsize: 12,
                    fontwaight: FontWeight.w600,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    alignment: Alignment.topLeft,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: constant.createdList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: MyText(
                                color: white,
                                text: constant.createdList[index],
                                fontsize: 12,
                                fontwaight: FontWeight.w400,
                                maxline: 2,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.left,
                                fontstyle: FontStyle.normal),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          // Total Hour , updatedat and language Btn
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primarydark,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: MyText(
                                  color: white,
                                  text: "Total Hours : 11 Hours",
                                  fontsize: 11,
                                  fontwaight: FontWeight.w600,
                                  maxline: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.left,
                                  fontstyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primarydark,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: MyText(
                                  color: white,
                                  text: "Update 11/12/2020",
                                  fontsize: 11,
                                  fontwaight: FontWeight.w600,
                                  maxline: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.left,
                                  fontstyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: primarydark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MyText(
                          color: white,
                          text: "CC,English",
                          fontsize: 12,
                          fontwaight: FontWeight.w600,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                          textalign: TextAlign.left,
                          fontstyle: FontStyle.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget childConainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(
        children: [
          // Space Box Top of Child
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
          ),
          // This Course included Box
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: lightgray,
                  blurRadius: 5,
                  offset: Offset(0.1, 0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                MyText(
                    color: primarydark,
                    fontwaight: FontWeight.w600,
                    fontsize: 16,
                    overflow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: "This course includes",
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: constant.courseincludeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          MyImage(
                            width: 7,
                            height: 7,
                            imagePath: "ic_dot.png",
                            color: primarylight,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              color: gray,
                              fontwaight: FontWeight.w600,
                              fontsize: 14,
                              overflow: TextOverflow.ellipsis,
                              maxline: 1,
                              text: constant.courseincludeList[index],
                              textalign: TextAlign.center,
                              fontstyle: FontStyle.normal),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // what you Learn Box
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: lightgray,
                  blurRadius: 5,
                  offset: Offset(0.1, 0.1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                MyText(
                    color: primarydark,
                    fontwaight: FontWeight.w600,
                    fontsize: 16,
                    overflow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: "What you learn",
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: constant.courseincludeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          MySvg(
                            width: 15,
                            height: 15,
                            imagePath: "ic_tick.svg",
                            color: primarylight,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              color: gray,
                              fontwaight: FontWeight.w600,
                              fontsize: 14,
                              overflow: TextOverflow.ellipsis,
                              maxline: 1,
                              text: constant.courseincludeList[index],
                              textalign: TextAlign.center,
                              fontstyle: FontStyle.normal),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: primarylight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MyText(
                    color: white,
                    text: "SHOW MORE",
                    textalign: TextAlign.center,
                    fontsize: 14,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    fontwaight: FontWeight.w500,
                    fontstyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          // Requirmemt Box
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: lightgray,
                  blurRadius: 5,
                  offset: Offset(0.1, 0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                MyText(
                    color: primarydark,
                    fontwaight: FontWeight.w600,
                    fontsize: 16,
                    overflow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: "Requirments",
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                const SizedBox(height: 10),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyImage(
                                width: 7,
                                height: 7,
                                imagePath: "ic_dot.png",
                                color: primarylight,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              MyText(
                                  color: gray,
                                  fontwaight: FontWeight.w600,
                                  fontsize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 1,
                                  text: "Any Version adobe illustrator",
                                  textalign: TextAlign.center,
                                  fontstyle: FontStyle.normal),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // Description Box
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: lightgray,
                  blurRadius: 5,
                  offset: Offset(0.1, 0.1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                MyText(
                    color: primarylight,
                    fontwaight: FontWeight.w600,
                    fontsize: 16,
                    overflow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: "Description",
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                const SizedBox(
                  height: 10,
                ),
                MyText(
                    color: gray,
                    text: text,
                    maxline: 5,
                    fontwaight: FontWeight.w500,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyText(
                      color: gray,
                      text: text,
                      maxline: 5,
                      fontwaight: FontWeight.w500,
                      textalign: TextAlign.left,
                      fontstyle: FontStyle.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    color: primarylight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MyText(
                    color: white,
                    text: "SHOW MORE",
                    textalign: TextAlign.center,
                    fontsize: 14,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    fontwaight: FontWeight.w500,
                    fontstyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Student also View with Text
          MyText(
              color: primarydark,
              fontwaight: FontWeight.w600,
              fontsize: 16,
              overflow: TextOverflow.ellipsis,
              maxline: 1,
              text: "Students also Viewed",
              textalign: TextAlign.center,
              fontstyle: FontStyle.normal),
          const SizedBox(
            height: 10,
          ),
          // StudentAlso view List
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                      margin:
                          const EdgeInsets.only(bottom: 10, left: 30, right: 0),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: lightgray,
                            blurRadius: 5,
                            offset: Offset(0.1, 0.1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              color: primarylight,
                              text:
                                  "Adobe illustrator CC- Advanced Traning Course",
                              fontsize: 14,
                              fontwaight: FontWeight.w600,
                              maxline: 2,
                              overflow: TextOverflow.ellipsis,
                              textalign: TextAlign.left,
                              fontstyle: FontStyle.normal),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar(
                                initialRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                ratingWidget: RatingWidget(
                                  full: MySvg(
                                      width: 5,
                                      height: 5,
                                      imagePath: "ic_rating.svg"),
                                  half: MyImage(
                                    height: 5,
                                    imagePath: "ic_eye.png",
                                    color: yellow,
                                    width: 5,
                                  ),
                                  empty: MyImage(
                                    height: 5,
                                    color: yellow,
                                    imagePath: "ic_eye.png",
                                    width: 5,
                                  ),
                                ),
                                itemPadding:
                                    const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                onRatingUpdate: (rating) {
                                  debugPrint("$rating");
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              MyText(
                                  color: gray,
                                  text: "4.7(13,513 Ratings)",
                                  fontsize: 12,
                                  fontwaight: FontWeight.w400,
                                  maxline: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.left,
                                  fontstyle: FontStyle.normal),
                            ],
                          ),
                          MyText(
                              color: primarylight,
                              text: "₹ 455.00",
                              fontsize: 14,
                              fontwaight: FontWeight.w600,
                              maxline: 2,
                              overflow: TextOverflow.ellipsis,
                              textalign: TextAlign.left,
                              fontstyle: FontStyle.normal),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MyImage(
                            width: 60,
                            height: 60,
                            imagePath: "demo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // course conetent Text
          MyText(
              color: primarylight,
              text: "Course Content",
              fontsize: 18,
              fontwaight: FontWeight.w600,
              maxline: 2,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.left,
              fontstyle: FontStyle.normal),
          const SizedBox(
            height: 10,
          ),
          // course conetent Box
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: primarylight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    color: white,
                    text: "Curriculim",
                    fontsize: 16,
                    fontwaight: FontWeight.w600,
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                MyText(
                    color: white,
                    text: "12 sections",
                    fontsize: 14,
                    fontwaight: FontWeight.w400,
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                MyText(
                    color: white,
                    text: "43 lectures | 9h 23m Totle Length",
                    fontsize: 14,
                    fontwaight: FontWeight.w400,
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
              ],
            ),
          ),
          // expandedList
          expandedList(),
          // 7more item Btn
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primarylight, borderRadius: BorderRadius.circular(7)),
            child: MyText(
                color: white,
                text: "7 MORE SECTION",
                fontsize: 14,
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                fontwaight: FontWeight.w500,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
          ),
          // created By Box
          Container(
            width: MediaQuery.of(context).size.width,
            height: 320,
            margin: const EdgeInsets.only(top: 5, right: 20, left: 20),
            child: Column(
              children: [
                const SizedBox(height: 15),
                MyText(
                    color: primarylight,
                    text: "Created By",
                    fontsize: 18,
                    fontwaight: FontWeight.w600,
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: lightgray,
                        blurRadius: 5,
                        offset: Offset(0.1, 0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    color: primarylight,
                                    text: "Video Scholl",
                                    fontsize: 14,
                                    fontwaight: FontWeight.w600,
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textalign: TextAlign.left,
                                    fontstyle: FontStyle.normal),
                                const SizedBox(
                                  height: 5,
                                ),
                                MyText(
                                    color: gray,
                                    text: "Learn Creative Skills",
                                    fontsize: 12,
                                    fontwaight: FontWeight.w600,
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textalign: TextAlign.left,
                                    fontstyle: FontStyle.normal),
                              ],
                            ),
                            const Spacer(),
                            MyText(
                                color: primarylight,
                                text: "View Profile",
                                fontsize: 12,
                                fontwaight: FontWeight.w600,
                                maxline: 2,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.left,
                                fontstyle: FontStyle.normal),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 210,
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: MyImage(
                                    width: 80,
                                    height: 80,
                                    imagePath: "demo.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MySvg(
                                            width: 15,
                                            height: 15,
                                            color: orange,
                                            imagePath: "ic_rating.svg"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyText(
                                            color: primarylight,
                                            text: "4.5 Instricter Rating",
                                            fontsize: 12,
                                            fontwaight: FontWeight.w600,
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyImage(
                                            width: 15,
                                            height: 15,
                                            color: orange,
                                            imagePath: "ic_review.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyText(
                                            color: primarylight,
                                            text: "270,051 Reviews",
                                            fontsize: 12,
                                            fontwaight: FontWeight.w600,
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyImage(
                                            width: 15,
                                            height: 15,
                                            color: orange,
                                            imagePath: "ic_eye.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyText(
                                            color: primarylight,
                                            text: "2,036,096 Students",
                                            fontsize: 12,
                                            fontwaight: FontWeight.w600,
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MySvg(
                                            width: 15,
                                            height: 15,
                                            color: orange,
                                            imagePath: "ic_videoplay.svg"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        MyText(
                                            color: primarylight,
                                            text: "153 Courses",
                                            fontsize: 12,
                                            fontwaight: FontWeight.w600,
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                    left: 5, right: 5, top: 20),
                                decoration: BoxDecoration(
                                  color: primarylight,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MyText(
                                      color: white,
                                      text: "VIEW ALL",
                                      textalign: TextAlign.center,
                                      fontsize: 14,
                                      maxline: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontwaight: FontWeight.w500,
                                      fontstyle: FontStyle.normal,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Student Feddback Box
          MyText(
              color: primarylight,
              text: "Student Feedback",
              fontsize: 18,
              fontwaight: FontWeight.w500,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.center,
              fontstyle: FontStyle.normal),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: gray,
                  blurRadius: 5,
                  offset: Offset(0.0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                        color: primarylight,
                        text: "4.7",
                        fontsize: 20,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                    const SizedBox(width: 10),
                    MyText(
                        color: gray,
                        text: "Course Rating",
                        fontsize: 12,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 10),
                RatingBar(
                  initialRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    empty:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 7,
                      barRadius: const Radius.circular(5),
                      backgroundColor: gray,
                      progressColor: primarylight,
                      width: MediaQuery.of(context).size.width * 0.7,
                      percent: 0.6,
                    ),
                    MyText(
                        color: primarylight,
                        text: "60 %",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 7),
                RatingBar(
                  initialRating: 4,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    empty: MySvg(
                        width: 5, height: 5, imagePath: "ic_notRating.svg"),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 7,
                      barRadius: const Radius.circular(5),
                      backgroundColor: gray,
                      progressColor: primarylight,
                      width: MediaQuery.of(context).size.width * 0.7,
                      percent: 0.40,
                    ),
                    MyText(
                        color: primarylight,
                        text: "26 %",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 7),
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    empty: MySvg(
                        width: 5, height: 5, imagePath: "ic_notRating.svg"),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 7,
                      barRadius: const Radius.circular(5),
                      backgroundColor: gray,
                      progressColor: primarylight,
                      width: MediaQuery.of(context).size.width * 0.7,
                      percent: 0.25,
                    ),
                    MyText(
                        color: primarylight,
                        text: "14 %",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 7),
                RatingBar(
                  initialRating: 2,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    empty: MySvg(
                        width: 5, height: 5, imagePath: "ic_notRating.svg"),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 7,
                      barRadius: const Radius.circular(5),
                      backgroundColor: gray,
                      progressColor: primarylight,
                      width: MediaQuery.of(context).size.width * 0.7,
                      percent: 0.15,
                    ),
                    MyText(
                        color: primarylight,
                        text: "0 %",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 7),
                RatingBar(
                  initialRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    half:
                        MySvg(width: 5, height: 5, imagePath: "ic_rating.svg"),
                    empty: MySvg(
                        width: 5, height: 5, imagePath: "ic_notRating.svg"),
                  ),
                  itemPadding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  onRatingUpdate: (rating) {
                    debugPrint("$rating");
                  },
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 7,
                      barRadius: const Radius.circular(5),
                      backgroundColor: gray,
                      progressColor: primarylight,
                      width: MediaQuery.of(context).size.width * 0.7,
                      percent: 0.15,
                    ),
                    MyText(
                        color: primarylight,
                        text: "0 %",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MyText(
                        color: primarylight,
                        text: "Dhivya Sudha",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                    const Spacer(),
                    RatingBar(
                      initialRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      ratingWidget: RatingWidget(
                        full: MySvg(
                            width: 5, height: 5, imagePath: "ic_rating.svg"),
                        half: MySvg(
                            width: 5, height: 5, imagePath: "ic_notRating.svg"),
                        empty: MySvg(
                            width: 5, height: 5, imagePath: "ic_notRating.svg"),
                      ),
                      itemPadding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      onRatingUpdate: (rating) {
                        debugPrint("$rating");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: MyText(
                          color: gray,
                          text: text,
                          fontsize: 12,
                          fontwaight: FontWeight.w500,
                          maxline: 5,
                          overflow: TextOverflow.ellipsis,
                          textalign: TextAlign.left,
                          fontstyle: FontStyle.normal),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                MyText(
                    color: gray,
                    text: "2 Month Age",
                    fontsize: 12,
                    fontwaight: FontWeight.w500,
                    maxline: 5,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MyText(
                        color: primarylight,
                        text: "Nathan Lemuel",
                        fontsize: 16,
                        fontwaight: FontWeight.w500,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                    const Spacer(),
                    RatingBar(
                      initialRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      ratingWidget: RatingWidget(
                        full: MySvg(
                            width: 5, height: 5, imagePath: "ic_rating.svg"),
                        half: MySvg(
                            width: 5, height: 5, imagePath: "ic_rating.svg"),
                        empty: MySvg(
                            width: 5, height: 5, imagePath: "ic_rating.svg"),
                      ),
                      itemPadding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      onRatingUpdate: (rating) {
                        debugPrint("$rating");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MyText(
                    color: gray,
                    text: text,
                    fontsize: 12,
                    fontwaight: FontWeight.w500,
                    maxline: 5,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.left,
                    fontstyle: FontStyle.normal),
                const SizedBox(height: 15),
                Row(
                  children: [
                    MyText(
                        color: gray,
                        text: "2 Month Age",
                        fontsize: 12,
                        fontwaight: FontWeight.w500,
                        maxline: 5,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.left,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primarylight,
                      borderRadius: BorderRadius.circular(7)),
                  child: MyText(
                      color: white,
                      text: "VIEW ALL",
                      fontsize: 14,
                      maxline: 1,
                      overflow: TextOverflow.ellipsis,
                      fontwaight: FontWeight.w500,
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget expandedList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return const ExpandedList();
      },
    );
  }
}
