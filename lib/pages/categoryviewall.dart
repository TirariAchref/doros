import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';

class CategoryViewall extends StatefulWidget {
  const CategoryViewall({super.key});

  @override
  State<CategoryViewall> createState() => _CategoryViewallState();
}

class _CategoryViewallState extends State<CategoryViewall> {
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
            text: "Category",
            startImgcolor: white,
            textcolor: white,
            type: 1,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        color: white,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: constant.categoryList.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: MySvg(
                            width: 60,
                            height: 60,
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
    );
  }
}
