import 'package:doros/pages/account.dart';
import 'package:doros/pages/featured.dart';
import 'package:doros/pages/mycourse.dart';
import 'package:doros/pages/search.dart';
import 'package:doros/pages/wishlist.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => BottombarState();
}

class BottombarState extends State<Bottombar> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    const Featured(),
    const Search(),
    const MyCourse(),
    const WishList(),
    const Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          backgroundColor: white,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: orange,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: primarydark,
          ),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedIconTheme: const IconThemeData(color: orange),
          unselectedIconTheme: const IconThemeData(color: primarydark),
          elevation: 2,
          currentIndex: selectedIndex,
          selectedItemColor: orange,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: white,
              label: "Featured",
              activeIcon: MySvg(
                imagePath: "ic_rating.svg",
                width: 25,
                height: 25,
                color: orange,
              ),
              icon: Align(
                alignment: Alignment.center,
                child: MySvg(
                  imagePath: "ic_rating.svg",
                  width: 25,
                  height: 25,
                  color: primarydark,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Search",
              backgroundColor: white,
              activeIcon: MySvg(
                imagePath: "ic_search.svg",
                width: 25,
                height: 25,
                color: orange,
              ),
              icon: Align(
                alignment: Alignment.center,
                child: MySvg(
                  imagePath: "ic_search.svg",
                  width: 25,
                  height: 25,
                  color: primarydark,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "My Course",
              backgroundColor: white,
              activeIcon: MySvg(
                imagePath: "ic_videoplay.svg",
                width: 25,
                height: 25,
                color: orange,
              ),
              icon: Align(
                alignment: Alignment.center,
                child: MySvg(
                  width: 25,
                  height: 25,
                  color: primarydark,
                  imagePath: "ic_videoplay.svg",
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: white,
              label: "WishList",
              activeIcon: MySvg(
                imagePath: "ic_wishlist.svg",
                width: 25,
                height: 25,
                color: orange,
              ),
              icon: Align(
                alignment: Alignment.center,
                child: MySvg(
                  width: 25,
                  height: 25,
                  color: primarydark,
                  imagePath: "ic_wishlist.svg",
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: white,
              label: "Account",
              activeIcon: MySvg(
                imagePath: "ic_account.svg",
                width: 25,
                height: 25,
                color: orange,
              ),
              icon: Align(
                alignment: Alignment.center,
                child: MySvg(
                  width: 25,
                  height: 25,
                  color: primarydark,
                  imagePath: "ic_account.svg",
                ),
              ),
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
