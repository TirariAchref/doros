import 'dart:developer';

import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'detail.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  State<MyCourse> createState() => MyCourseState();
}

class MyCourseState extends State<MyCourse> {
  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primarydark,
        elevation: 0,
        title: MyAppbar(
          type: 1,
          text: "MyCourses",
          textcolor: white,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
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
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        // dismissible: DismissiblePane(onDismissed: () {}),
                        children: [],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          // delete Button
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              log("Click====>$index");
                              setState(() {
                                constant.courselist.removeAt(index);
                              });
                            },
                            backgroundColor: white,
                            icon: Icons.delete,
                            foregroundColor: primarydark,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: lightgray,
                                blurRadius: 5,
                                offset: Offset(0.1, 0.1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyImage(
                                  width: 80,
                                  height: MediaQuery.of(context).size.height,
                                  imagePath: constant.courselist[index],
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 7),
                                      SizedBox(
                                        width: 150,
                                        child: MyText(
                                            color: gray,
                                            text:
                                                "Adobe illustrater CC- Essentials Traning Course",
                                            maxline: 2,
                                            fontwaight: FontWeight.w600,
                                            fontsize: 12,
                                            overflow: TextOverflow.ellipsis,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                      ),
                                      const SizedBox(height: 7),
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
                                              color: black,
                                              text: "4.7(40,213)",
                                              fontsize: 10,
                                              fontwaight: FontWeight.w600,
                                              maxline: 2,
                                              textalign: TextAlign.left,
                                              fontstyle: FontStyle.normal),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 40,
                                  child: CircularPercentIndicator(
                                    radius: 30.0,
                                    lineWidth: 3.0,
                                    percent: constant.parcentageList[index],
                                    animationDuration: 3000,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    animation: true,
                                    center: MyText(
                                        color: black,
                                        text:
                                            constant.percentageTextList[index],
                                        fontsize: 14,
                                        fontwaight: FontWeight.w600,
                                        maxline: 2,
                                        textalign: TextAlign.left,
                                        fontstyle: FontStyle.normal),
                                    progressColor: constant.colorsList[index],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
