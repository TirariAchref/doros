import 'dart:developer';

import 'package:doros/pages/checkout.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Constant constant = Constant();

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
            text: "Cart",
            textcolor: white,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              cartList(),
              const SizedBox(height: 10),
              couponCode(),
              const SizedBox(height: 20),
              couponCodeItem(),
              const SizedBox(height: 50),
              cartButton(),
            ],
          ),
        ),
      ),
    );
  }

// Cart List
  Widget cartList() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: constant.cartlist.length,
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
                      constant.cartlist.removeAt(index);
                    });
                  },
                  backgroundColor: white,
                  icon: Icons.delete,
                  foregroundColor: primarydark,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyImage(
                        width: 120,
                        height: MediaQuery.of(context).size.height,
                        imagePath: constant.cartlist[index],
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                color: black,
                                text: "\$ 455.00",
                                maxline: 1,
                                fontwaight: FontWeight.w600,
                                fontsize: 16,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal),
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
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// Coupon Code Text
  Widget couponCode() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      color: lightgray,
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.centerLeft,
      child: MyText(
          color: black,
          text: "Coupon Code",
          maxline: 1,
          fontwaight: FontWeight.w600,
          fontsize: 14,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

// couponcode item
  Widget couponCodeItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      color: primarylight,
                      text: "DS543228H",
                      maxline: 1,
                      fontwaight: FontWeight.w500,
                      fontsize: 14,
                      overflow: TextOverflow.ellipsis,
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                  const SizedBox(height: 5),
                  MyText(
                      color: primarylight,
                      text: "Discount if You apply coupon code",
                      maxline: 1,
                      fontwaight: FontWeight.w400,
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ],
              ),
              Container(
                width: 35,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: orange, borderRadius: BorderRadius.circular(5)),
                child: MyText(
                    color: black,
                    text: "20%",
                    maxline: 1,
                    fontwaight: FontWeight.w500,
                    fontsize: 10,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          child: Container(
                            width: 450,
                            height: 200,
                            // padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                          color: primarylight,
                                          text: "Apply Coupon Code",
                                          maxline: 1,
                                          fontwaight: FontWeight.w500,
                                          fontsize: 14,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.center,
                                          fontstyle: FontStyle.normal),
                                      MyImage(
                                          width: 20,
                                          height: 20,
                                          color: primarylight,
                                          imagePath: "ic_eye.png")
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Container(
                                    width: 35,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: MyText(
                                        color: black,
                                        text: "20%",
                                        maxline: 1,
                                        fontwaight: FontWeight.w500,
                                        fontsize: 10,
                                        overflow: TextOverflow.ellipsis,
                                        textalign: TextAlign.center,
                                        fontstyle: FontStyle.normal),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                              color: gray,
                                              text: "Your Coupon Code",
                                              maxline: 1,
                                              fontwaight: FontWeight.w500,
                                              fontsize: 12,
                                              overflow: TextOverflow.ellipsis,
                                              textalign: TextAlign.center,
                                              fontstyle: FontStyle.normal),
                                          const SizedBox(height: 10),
                                          MyText(
                                              color: black,
                                              text: "DS54328H",
                                              maxline: 1,
                                              fontwaight: FontWeight.w600,
                                              fontsize: 14,
                                              overflow: TextOverflow.ellipsis,
                                              textalign: TextAlign.center,
                                              fontstyle: FontStyle.normal),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                              color: gray,
                                              text: "Total Amount",
                                              maxline: 1,
                                              fontwaight: FontWeight.w500,
                                              fontsize: 12,
                                              overflow: TextOverflow.ellipsis,
                                              textalign: TextAlign.center,
                                              fontstyle: FontStyle.normal),
                                          const SizedBox(height: 10),
                                          MyText(
                                              color: primarylight,
                                              text: "\$ 728.00",
                                              maxline: 1,
                                              fontwaight: FontWeight.w600,
                                              fontsize: 14,
                                              overflow: TextOverflow.ellipsis,
                                              textalign: TextAlign.center,
                                              fontstyle: FontStyle.normal),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    // color: primary,
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Divider(
                                          color: lightgray,
                                          thickness: 1,
                                          height: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 45,
                                              alignment: Alignment.center,
                                              child: MyText(
                                                  color: gray,
                                                  text: "CANCEL",
                                                  maxline: 1,
                                                  fontwaight: FontWeight.w400,
                                                  fontsize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textalign: TextAlign.center,
                                                  fontstyle: FontStyle.normal),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 1,
                                              color: lightgray,
                                            ),
                                            Container(
                                              height: 45,
                                              alignment: Alignment.center,
                                              child: MyText(
                                                  color: black,
                                                  text: "CHECKOUT",
                                                  maxline: 1,
                                                  fontwaight: FontWeight.w500,
                                                  fontsize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textalign: TextAlign.center,
                                                  fontstyle: FontStyle.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 100,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primarylight,
                      borderRadius: BorderRadius.circular(5)),
                  child: MyText(
                      color: white,
                      text: "APPLY CODE",
                      maxline: 1,
                      fontwaight: FontWeight.w500,
                      fontsize: 10,
                      overflow: TextOverflow.ellipsis,
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ),
              ),
              const SizedBox(width: 10),
              MyText(
                  color: primarylight,
                  text: "OR",
                  maxline: 1,
                  fontwaight: FontWeight.w400,
                  fontsize: 12,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // DilogBox ApplyCode
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          child: Container(
                            width: 450,
                            height: 230,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                          color: primarylight,
                                          text: "Apply Coupon Code",
                                          maxline: 1,
                                          fontwaight: FontWeight.w500,
                                          fontsize: 14,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.center,
                                          fontstyle: FontStyle.normal),
                                      MyImage(
                                          width: 20,
                                          height: 20,
                                          color: primarylight,
                                          imagePath: "ic_eye.png")
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: MyText(
                                      color: primarylight,
                                      text:
                                          "Enter Coupon Code to get 20% Discount",
                                      maxline: 2,
                                      fontwaight: FontWeight.w400,
                                      fontsize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      textalign: TextAlign.center,
                                      fontstyle: FontStyle.normal),
                                ),
                                const SizedBox(height: 10),
                                MyText(
                                    color: black,
                                    text: "DS54328H",
                                    maxline: 1,
                                    fontwaight: FontWeight.w600,
                                    fontsize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    textalign: TextAlign.center,
                                    fontstyle: FontStyle.normal),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Divider(
                                    color: lightgray,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(height: 0),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      MyText(
                                          color: primarylight,
                                          text: "Total Amount",
                                          maxline: 1,
                                          fontwaight: FontWeight.w500,
                                          fontsize: 10,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.center,
                                          fontstyle: FontStyle.normal),
                                      MyText(
                                          color: primarylight,
                                          text: "\$ 728.00",
                                          maxline: 1,
                                          fontwaight: FontWeight.w600,
                                          fontsize: 12,
                                          overflow: TextOverflow.ellipsis,
                                          textalign: TextAlign.center,
                                          fontstyle: FontStyle.normal),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 0),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Divider(
                                          color: lightgray,
                                          thickness: 1,
                                          height: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 45,
                                              alignment: Alignment.center,
                                              child: MyText(
                                                  color: gray,
                                                  text: "CANCEL",
                                                  maxline: 1,
                                                  fontwaight: FontWeight.w400,
                                                  fontsize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textalign: TextAlign.center,
                                                  fontstyle: FontStyle.normal),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 1,
                                              color: lightgray,
                                            ),
                                            Container(
                                              height: 45,
                                              alignment: Alignment.center,
                                              child: MyText(
                                                  color: black,
                                                  text: "CHECKOUT",
                                                  maxline: 1,
                                                  fontwaight: FontWeight.w500,
                                                  fontsize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textalign: TextAlign.center,
                                                  fontstyle: FontStyle.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 100,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primarylight,
                      borderRadius: BorderRadius.circular(5)),
                  child: MyText(
                      color: white,
                      text: "ENTER CODE",
                      maxline: 1,
                      fontwaight: FontWeight.w500,
                      fontsize: 10,
                      overflow: TextOverflow.ellipsis,
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// Chackout Button and TotalAmount Btn
  Widget cartButton() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: InkWell(
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
              height: 60,
              color: primarydark,
              alignment: Alignment.center,
              child: MyText(
                  color: white,
                  text: "CHECKOUT",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: primarylight,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                    color: white,
                    text: "\$ 910.00",
                    maxline: 1,
                    fontwaight: FontWeight.w600,
                    fontsize: 16,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
                const SizedBox(
                  height: 5,
                ),
                MyText(
                    color: white,
                    text: "TOTAL AMOUNT",
                    maxline: 1,
                    fontwaight: FontWeight.w400,
                    fontsize: 10,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
