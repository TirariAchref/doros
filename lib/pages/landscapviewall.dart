import 'package:doros/pages/detail.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LandscapViewall extends StatefulWidget {
  const LandscapViewall({super.key});

  @override
  State<LandscapViewall> createState() => _LandscapViewallState();
}

class _LandscapViewallState extends State<LandscapViewall> {
  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: primarydark,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: MyAppbar(
            startImg: "ic_back.svg",
            startImgcolor: white,
            text: "All Course",
            textcolor: white,
            type: 1,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        color: white,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
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
                padding: const EdgeInsets.only(bottom: 20),
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
      ),
    );
  }
}
