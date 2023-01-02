import 'dart:developer';

import 'package:doros/pages/categoryviewall.dart';
import 'package:doros/pages/detail.dart';
import 'package:doros/pages/landscapviewall.dart';
import 'package:doros/pages/searchitem.dart';
import 'package:doros/pages/squareviewall.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  State<Featured> createState() => FeaturedState();
}

class FeaturedState extends State<Featured> {
  PageController pageController = PageController();
  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primarydark,
        elevation: 0,
        title: MyAppbar(
          type: 0,
          text: "Online Learning App",
          textcolor: white,
          endImg: "ic_cart.svg",
          endImgcolor: white,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              homeBanner(),
              category(),
              courseSuqare(),
              const SizedBox(height: 5),
              courseLandscap(),
            ],
          ),
        ),
      ),
    );
  }

// Featured Banner
  Widget homeBanner() {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: PageView.builder(
                  itemCount: Constant().bannerList.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Detail();
                            },
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MyImage(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.cover,
                                  imagePath: constant.bannerList[index]),
                            ),
                          ),
                          Positioned.fill(
                            bottom: 50,
                            left: 30,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: MyText(
                                  color: white,
                                  text: "Sales ends today",
                                  fontsize: 12,
                                  fontwaight: FontWeight.w600,
                                  maxline: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.center,
                                  fontstyle: FontStyle.normal),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 30, left: 30),
                                child: MyText(
                                    color: white,
                                    text: "Last Day to Save",
                                    fontsize: 10,
                                    fontwaight: FontWeight.w500,
                                    maxline: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textalign: TextAlign.center,
                                    fontstyle: FontStyle.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              alignment: Alignment.topCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: constant.bannerList.length,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                    spacing: 5,
                    radius: 50,
                    dotWidth: 5,
                    expansionFactor: 7,
                    dotColor: primarydark,
                    dotHeight: 5,
                    activeDotColor: orange),
              ),
            ),
          ],
        ),
      ],
    );
  }

// Category
  Widget category() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 190,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    color: primarydark,
                    text: "Category",
                    fontsize: 14,
                    fontwaight: FontWeight.w600,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 1,
                      color: lightgray,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        log("Click Viewall");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CategoryViewall();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: lightgray)),
                        child: MyText(
                            color: primarylight,
                            text: "View All",
                            fontsize: 10,
                            fontwaight: FontWeight.w500,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 70,
                      height: 1,
                      color: lightgray,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            padding: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerLeft,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: constant.categorImgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchItem(
                              itemName: constant.categoryList[index],
                            );
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: MySvg(
                                width: 50,
                                height: 50,
                                color: primarydark,
                                imagePath: constant.categorImgList[index]),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 70,
                            child: MyText(
                                color: primarylight,
                                text: constant.categoryList[index],
                                fontsize: 10,
                                fontwaight: FontWeight.w500,
                                maxline: 2,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

// top Course (Square)
  Widget courseSuqare() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 330,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    color: primarydark,
                    text: "Top Courses in Design",
                    fontsize: 14,
                    fontwaight: FontWeight.w600,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 1,
                      color: lightgray,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SuqareViewall();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: lightgray)),
                        child: MyText(
                            color: primarylight,
                            text: "View All",
                            fontsize: 10,
                            fontwaight: FontWeight.w500,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 70,
                      height: 1,
                      color: lightgray,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            alignment: Alignment.centerLeft,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: constant.courselist.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Detail();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        width: 220,
                        height: 220,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1, color: orange),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: MyImage(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.fill,
                                    imagePath: constant.courselist[index]),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              // color: orange,
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                      color: black,
                                      text: "\$ 13.00",
                                      fontsize: 14,
                                      fontwaight: FontWeight.w500,
                                      maxline: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textalign: TextAlign.center,
                                      fontstyle: FontStyle.normal),
                                  const SizedBox(height: 15),
                                  MyText(
                                      color: primarylight,
                                      text:
                                          "Adobe illustrator CC-Essential Traning Course",
                                      fontsize: 12,
                                      fontwaight: FontWeight.w500,
                                      maxline: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textalign: TextAlign.left,
                                      fontstyle: FontStyle.normal),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      RatingBar(
                                        initialRating: 5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 10,
                                        ratingWidget: RatingWidget(
                                          full: MySvg(
                                              width: 5,
                                              height: 5,
                                              imagePath: "ic_rating.svg"),
                                          half: MySvg(
                                              width: 5,
                                              height: 5,
                                              imagePath: "ic_rating.svg"),
                                          empty: MySvg(
                                              width: 5,
                                              height: 5,
                                              imagePath: "ic_rating.svg"),
                                        ),
                                        itemPadding: const EdgeInsets.fromLTRB(
                                            1, 0, 1, 0),
                                        onRatingUpdate: (rating) {
                                          debugPrint("$rating");
                                        },
                                      ),
                                      const SizedBox(width: 5),
                                      MyText(
                                          color: primarylight,
                                          text: "4.7(1000)",
                                          fontsize: 12,
                                          fontwaight: FontWeight.w500,
                                          maxline: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.left,
                                          fontstyle: FontStyle.normal),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

// All Course (Landscap)
  Widget courseLandscap() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyText(
            color: primarydark,
            text: "All Course",
            fontsize: 14,
            fontwaight: FontWeight.w600,
            maxline: 1,
            overflow: TextOverflow.ellipsis,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 1,
              color: lightgray,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LandscapViewall();
                    },
                  ),
                );
              },
              child: Container(
                width: 70,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: lightgray)),
                child: MyText(
                    color: primarylight,
                    text: "View All",
                    fontsize: 10,
                    fontwaight: FontWeight.w500,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 70,
              height: 1,
              color: lightgray,
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: constant.courselist.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(width: 1, color: orange),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height,
                          color: orange,
                          alignment: Alignment.center,
                          child: MyText(
                              color: white,
                              text: "BEST SELLER",
                              fontsize: 10,
                              fontwaight: FontWeight.w400,
                              maxline: 2,
                              textalign: TextAlign.left,
                              fontstyle: FontStyle.normal),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: MyImage(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      fit: BoxFit.fill,
                                      imagePath: constant.courselist[index]),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                        color: black,
                                        text:
                                            "The Complete Financial Analyst Course 2020",
                                        fontsize: 12,
                                        fontwaight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis,
                                        maxline: 2,
                                        textalign: TextAlign.left,
                                        fontstyle: FontStyle.normal),
                                    const SizedBox(height: 5),
                                    MyText(
                                        color: primarylight,
                                        text: "365 Careers",
                                        fontsize: 10,
                                        fontwaight: FontWeight.w400,
                                        maxline: 2,
                                        textalign: TextAlign.left,
                                        fontstyle: FontStyle.normal),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RatingBar(
                                          initialRating: 5,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 10,
                                          ratingWidget: RatingWidget(
                                            full: MySvg(
                                                width: 5,
                                                height: 5,
                                                imagePath: "ic_rating.svg"),
                                            half: MySvg(
                                                width: 5,
                                                height: 5,
                                                imagePath: "ic_rating.svg"),
                                            empty: MySvg(
                                                width: 5,
                                                height: 5,
                                                imagePath: "ic_rating.svg"),
                                          ),
                                          itemPadding:
                                              const EdgeInsets.fromLTRB(
                                                  1, 0, 1, 0),
                                          onRatingUpdate: (rating) {
                                            debugPrint("$rating");
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        MyText(
                                            color: black,
                                            text: "4.7(40,213)",
                                            fontsize: 10,
                                            fontwaight: FontWeight.w600,
                                            maxline: 2,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    MyText(
                                        color: black,
                                        text: "₹ 500.00",
                                        fontsize: 12,
                                        fontwaight: FontWeight.w600,
                                        maxline: 2,
                                        textalign: TextAlign.left,
                                        fontstyle: FontStyle.normal),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
