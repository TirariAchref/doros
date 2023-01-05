import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/intro.dart';
import 'package:doros/pages/authnetification/login.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    checkFirstSeen();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [uppercolorintro, lowercolorintro])),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Image.asset(
                          "assets/images/Logo_Plan de travail 1.png",
                          width: 460,
                          height: 215)),
                  const SizedBox(height: 40),
                  MyText(
                    color: lowercolorintro,
                    text: "Doroos App",
                    fontsize: 24,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    fontwaight: FontWeight.w800,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal,
                  )
                ],
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
          ],
        ),
      ),
    );
  }

  Future checkFirstSeen() async {
    int splashtime = 3;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool seen = (prefs.getBool('seen') ?? false);
    debugPrint("boolian Main statement is : $seen");

    if (seen) {
      debugPrint("Boolian statement if Condition : $seen");
      Future.delayed(
        Duration(seconds: splashtime),
        () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Login();
              },
            ),
          );
        },
      );
    } else {
      debugPrint("Boolian statement Else Condition : $seen");
      Future.delayed(
        Duration(seconds: splashtime),
        () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Intro();
              },
            ),
          );
        },
      );
    }
  }
}
