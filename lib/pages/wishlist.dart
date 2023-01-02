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

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => WishListState();
}

class WishListState extends State<WishList> {
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
          text: "Wishlist",
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
                  return Slidable(
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
                        height: 120,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                        color: black,
                                        text: "IT Course",
                                        maxline: 2,
                                        fontwaight: FontWeight.w600,
                                        fontsize: 10,
                                        overflow: TextOverflow.ellipsis,
                                        textalign: TextAlign.left,
                                        fontstyle: FontStyle.normal),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 200,
                                      child: MyText(
                                          color: primarydark,
                                          text:
                                              "Adobe illustrater CC- Essentials Traning Course",
                                          maxline: 2,
                                          fontwaight: FontWeight.w600,
                                          fontsize: 12,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.left,
                                          fontstyle: FontStyle.normal),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        MyText(
                                            color: black,
                                            text: "\$ 135.00",
                                            fontsize: 12,
                                            fontwaight: FontWeight.w600,
                                            maxline: 2,
                                            textalign: TextAlign.left,
                                            fontstyle: FontStyle.normal),
                                        const SizedBox(width: 8),
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
                                            half: MySvg(
                                                width: 5,
                                                height: 5,
                                                imagePath: "ic_rating.svg"),
                                            empty: MySvg(
                                                width: 5,
                                                height: 5,
                                                color: orange,
                                                imagePath: "ic_norating.svg"),
                                          ),
                                          itemPadding:
                                              const EdgeInsets.fromLTRB(
                                                  1, 0, 1, 0),
                                          onRatingUpdate: (rating) {
                                            debugPrint("$rating");
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              MyImage(
                                width: 100,
                                height: MediaQuery.of(context).size.height,
                                imagePath: constant.courselist[index],
                                fit: BoxFit.fill,
                              ),
                            ],
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
