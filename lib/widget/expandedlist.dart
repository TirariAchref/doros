import 'package:doros/utils/color.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandedList extends StatelessWidget {
  const ExpandedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                  tapBodyToCollapse: true,
                  iconColor: gray,
                ),
                header: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MyText(
                      color: primarylight,
                      fontsize: 14,
                      maxline: 2,
                      fontwaight: FontWeight.w600,
                      text: "Introduction to Adobe illustrator",
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ),
                collapsed: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            MyText(
                                color: primarylight,
                                fontsize: 14,
                                maxline: 1,
                                fontwaight: FontWeight.w600,
                                text: "1",
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MyText(
                                      color: primarylight,
                                      fontsize: 12,
                                      maxline: 2,
                                      fontwaight: FontWeight.w600,
                                      text:
                                          "Welcome to the Adobe illustator Essentials Course",
                                      textalign: TextAlign.left,
                                      fontstyle: FontStyle.normal),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MySvg(
                                          width: 10,
                                          height: 10,
                                          color: orange,
                                          imagePath: "ic_videoplay.svg"),
                                      const SizedBox(width: 5),
                                      MyText(
                                          color: gray,
                                          fontsize: 10,
                                          maxline: 2,
                                          fontwaight: FontWeight.w600,
                                          text: "Video : 07:24 Mins",
                                          textalign: TextAlign.left,
                                          fontstyle: FontStyle.normal),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: MyText(
                                color: primarylight,
                                fontsize: 10,
                                maxline: 1,
                                fontwaight: FontWeight.w600,
                                text: "Preview",
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        color: gray,
                        fontsize: 12,
                        maxline: 2,
                        fontwaight: FontWeight.w400,
                        text: "9 lectures | 1hr 47 mins",
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
