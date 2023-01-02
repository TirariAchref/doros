import 'package:doros/pages/detail.dart';
import 'package:doros/pages/landscapviewall.dart';
import 'package:doros/pages/squareviewall.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchItem extends StatefulWidget {
  var itemName;
  SearchItem({Key? key, this.itemName}) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<String> courseStartlist = <String>[
    "demo1.png",
    "demo1.png",
    "demo1.png",
    "demo1.png",
  ];

  List<String> courselist = <String>[
    "demo1.png",
    "demo1.png",
    "demo1.png",
    "demo1.png",
  ];

  List<String> topSearchList = <String>[
    "Stock Trading",
    "Investing",
    "forex",
    "Dry Trandig",
    "Excel",
    "Financial Analysis",
    "Design",
    "Stock Trading",
    "Investing",
    "forex",
    "Dry Trandig",
    "Excel",
    "Financial Analysis",
    "Design",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: white,
        centerTitle: true,
        title: MyAppbar(
          startImg: "ic_back.svg",
          endImg: "ic_cart.svg",
          text: widget.itemName,
          type: 1,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              courseSuqare(),
              feturedCourseSuqare(),
              popularTopicSection(),
              subCategory(),
              topInstucter(),
              courseLandscap(),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Course to get you started List
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
                    color: primarylight,
                    text: "Course to get you started",
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
                      color: primarylight,
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
                            border: Border.all(width: 1, color: primarylight)),
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
                      color: primarylight,
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
                itemCount: courseStartlist.length,
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                    imagePath: courseStartlist[index]),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 123,
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
                                            itemPadding:
                                                const EdgeInsets.fromLTRB(
                                                    1, 0, 1, 0),
                                            onRatingUpdate: (rating) {
                                              debugPrint("$rating");
                                            },
                                          ),
                                          const SizedBox(width: 7),
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
                                      ),
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

// Futured Course List
  Widget feturedCourseSuqare() {
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
                    color: primarylight,
                    text: "Futured Course",
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
                      color: primarylight,
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
                            border: Border.all(width: 1, color: primarylight)),
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
                      color: primarylight,
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
                itemCount: courseStartlist.length,
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                    imagePath: courseStartlist[index]),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 123,
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
                                      const SizedBox(width: 7),
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

// PopularTopicSection With Row List
  Widget popularTopicSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        MyText(
            color: primarylight,
            text: "Popular Topic",
            fontsize: 16,
            overflow: TextOverflow.ellipsis,
            maxline: 1,
            fontwaight: FontWeight.w600,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
        const SizedBox(height: 20),
        Container(
          height: 130,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: -3,
              direction: Axis.vertical,
              children: topSearchList
                  .map(
                    (index) => InkWell(
                      onTap: () {
                        debugPrint("Serach=======>$index");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Detail();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(width: 1, color: gray)),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: MyText(
                            color: primarylight,
                            text: index.toString(),
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1,
                            fontwaight: FontWeight.w600,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

// SubCategory With Row List
  Widget subCategory() {
    return Column(
      children: [
        const SizedBox(height: 20),
        MyText(
            color: primarylight,
            text: "Sub Categories",
            fontsize: 16,
            overflow: TextOverflow.ellipsis,
            maxline: 1,
            fontwaight: FontWeight.w600,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
        const SizedBox(height: 20),
        Container(
          height: 130,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: -3,
              direction: Axis.vertical,
              children: topSearchList
                  .map(
                    (index) => InkWell(
                      onTap: () {
                        debugPrint("Serach=======>$index");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchItem(
                                itemName: index,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(width: 1, color: gray)),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: MyText(
                            color: primarylight,
                            text: index.toString(),
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1,
                            fontwaight: FontWeight.w600,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

// Top instracter List
  Widget topInstucter() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    color: primarylight,
                    text: "Top Instracter",
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
                      color: primarylight,
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
                            border: Border.all(width: 1, color: primarylight)),
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
                      color: primarylight,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            alignment: Alignment.centerLeft,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: courseStartlist.length,
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        width: 220,
                        height: 220,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1, color: orange),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: MyImage(
                                width: 70,
                                height: 70,
                                imagePath: "demo.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            MyText(
                                color: black,
                                text: "365 Carrers",
                                fontsize: 14,
                                fontwaight: FontWeight.w600,
                                maxline: 1,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: MyText(
                                  color: black,
                                  text:
                                      "Create oppurtinity for bissness & Finance Students",
                                  fontsize: 12,
                                  fontwaight: FontWeight.w400,
                                  maxline: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.center,
                                  fontstyle: FontStyle.normal),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MyText(
                                  color: black,
                                  text: "50 Carrers",
                                  fontsize: 12,
                                  fontwaight: FontWeight.w400,
                                  maxline: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textalign: TextAlign.center,
                                  fontstyle: FontStyle.normal),
                            ),
                            MyText(
                                color: black,
                                text: "10,000 Students",
                                fontsize: 12,
                                fontwaight: FontWeight.w500,
                                maxline: 1,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal),
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

// All Course Landscap
  Widget courseLandscap() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    color: primarylight,
                    text: "All Course",
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
                      color: primarylight,
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
                            border: Border.all(width: 1, color: primarylight)),
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
                      color: primarylight,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courselist.length,
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
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                              width: 90,
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          fit: BoxFit.fill,
                                          imagePath: courselist[index]),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        const SizedBox(height: 7),
                                        MyText(
                                            color: primarylight,
                                            text: "365 Careers",
                                            fontsize: 10,
                                            fontwaight: FontWeight.w400,
                                            maxline: 2,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                        const SizedBox(height: 7),
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
                                            const SizedBox(width: 7),
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
                                        const SizedBox(height: 7),
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
              }),
        ],
      ),
    );
  }
}
