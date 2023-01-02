import 'package:doros/pages/categoryviewall.dart';
import 'package:doros/pages/searchitem.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/constant.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController searchControler = TextEditingController();
  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: MyAppbar(
          type: 0,
          text: "Search",
          textcolor: black,
          endImg: "ic_cart.svg",
          endImgcolor: black,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              searchbar(),
              const SizedBox(height: 10),
              topsearchSection(),
              const SizedBox(height: 20),
              browserCategory(),
            ],
          ),
        ),
      ),
    );
  }

// Search Bar
  Widget searchbar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: white,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 6),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(
              color: gray,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: const Icon(Icons.search),
            ),
          ),
          Flexible(
            flex: 6,
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                controller: searchControler,
                maxLines: 1,
                style: GoogleFonts.inter(
                  color: primarylight,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintStyle: GoogleFonts.inter(
                      color: primarylight,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  hintText: "search what ever you like...",
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

// Top search Text With List
  Widget topsearchSection() {
    return Column(
      children: [
        // Text
        MyText(
            color: primarylight,
            text: "Top Searches",
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
              spacing: 10,
              runSpacing: 5,
              alignment: WrapAlignment.start,
              direction: Axis.vertical,
              children: [
                ...List.generate(
                  constant.categoryList.length,
                  (index) => InkWell(
                    onTap: () {
                      debugPrint("Serach=======>$index");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchItem(
                              itemName: constant.categoryList[index].toString(),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 35,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(width: 1, color: gray)),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: MyText(
                          color: primarylight,
                          text: constant.categoryList[index].toString(),
                          fontsize: 12,
                          overflow: TextOverflow.ellipsis,
                          maxline: 1,
                          fontwaight: FontWeight.w600,
                          textalign: TextAlign.center,
                          fontstyle: FontStyle.normal),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

// browser Category GridView
  Widget browserCategory() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyText(
            color: primarylight,
            text: "Browser Category",
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
                    border: Border.all(width: 1, color: primarylight)),
                child: MyText(
                    color: primarylight,
                    text: "View All",
                    fontsize: 10,
                    fontwaight: FontWeight.w600,
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
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          alignment: Alignment.centerLeft,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: constant.categoryList.length,
              itemBuilder: (BuildContext ctx, index) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: MySvg(
                            width: 55,
                            height: 55,
                            imagePath: constant.categorImgList[index]),
                      ),
                      const SizedBox(height: 5),
                      MyText(
                          color: primarylight,
                          text: constant.categoryList[index],
                          fontsize: 12,
                          fontwaight: FontWeight.w500,
                          maxline: 2,
                          overflow: TextOverflow.ellipsis,
                          textalign: TextAlign.center,
                          fontstyle: FontStyle.normal),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
