import 'package:doros/pages/bottombar.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => IntroState();
}

class IntroState extends State<Intro> {
  PageController pageController = PageController();
  Constant constant = Constant();

  int position = 0;

  Future chack() async {
    SharedPreferences homeprefs = await SharedPreferences.getInstance();
    homeprefs.setBool('seen', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [uppercolorintro, lowercolorintro])),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                itemCount: constant.introimgList.length,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 270,
                        child: MySvg(
                          imagePath: constant.introimgList[index],
                          width: 270,
                          height: 270,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        alignment: Alignment.center,
                        child: MyText(
                            color: white,
                            text: constant.introMainText[position],
                            fontsize: 16,
                            fontwaight: FontWeight.w500,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: MyText(
                            color: white,
                            text: constant.introChildText[position],
                            fontsize: 14,
                            fontwaight: FontWeight.w400,
                            maxline: 5,
                            overflow: TextOverflow.ellipsis,
                            textalign: TextAlign.center,
                            fontstyle: FontStyle.normal),
                      ),
                    ],
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    position = index;
                  });
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topLeft,
                child: MySvg(
                  width: 200,
                  height: 200,
                  color: primarylight,
                  imagePath: "ic_corner.svg",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: constant.introimgList.length,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 5,
                      dotHeight: 5,
                      dotColor: white,
                      expansionFactor: 5,
                      activeDotColor: orange,
                      radius: 50,
                      strokeWidth: 1,
                      spacing: 5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          chack();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Bottombar();
                              },
                            ),
                          );
                        },
                        child: MyText(
                            color: white,
                            text: "Skip",
                            textalign: TextAlign.center,
                            fontsize: 14,
                            fontwaight: FontWeight.w500,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            fontstyle: FontStyle.normal),
                      ),
                      InkWell(
                        onTap: () {
                          if (position == constant.introimgList.length - 1) {
                            chack();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Bottombar(),
                              ),
                            );
                          }
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: primarydark,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            alignment: Alignment.center,
                            child: MySvg(
                                width: 20,
                                height: 20,
                                color: white,
                                imagePath: "ic_next.svg"),
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
    );
  }
}
