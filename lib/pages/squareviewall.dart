import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SuqareViewall extends StatefulWidget {
  const SuqareViewall({super.key});

  @override
  State<SuqareViewall> createState() => _SuqareViewallState();
}

class _SuqareViewallState extends State<SuqareViewall> {
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
            text: "Top Course in Design",
            startImg: "ic_back.svg",
            startImgcolor: white,
            textcolor: white,
            type: 1,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        color: white,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: constant.bannerList.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(width: 1, color: orange),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
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
                      height: 90,
                      // color: orange,
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7),
                          MyText(
                              color: black,
                              text: "\$ 13.00",
                              fontsize: 12,
                              fontwaight: FontWeight.w500,
                              maxline: 1,
                              overflow: TextOverflow.ellipsis,
                              textalign: TextAlign.center,
                              fontstyle: FontStyle.normal),
                          const SizedBox(height: 7),
                          MyText(
                              color: primarylight,
                              text:
                                  "Adobe illustrator CC-Essential Traning Course",
                              fontsize: 10,
                              fontwaight: FontWeight.w500,
                              maxline: 2,
                              overflow: TextOverflow.ellipsis,
                              textalign: TextAlign.left,
                              fontstyle: FontStyle.normal),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              RatingBar(
                                initialRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 5,
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
                                    const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                onRatingUpdate: (rating) {
                                  debugPrint("$rating");
                                },
                              ),
                              const SizedBox(width: 5),
                              MyText(
                                  color: primarylight,
                                  text: "4.7(1000)",
                                  fontsize: 10,
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
            );
          },
        ),
      ),
    );
  }
}
