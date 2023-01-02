import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/intro.dart';
import 'package:doros/pages/login.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
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
                  MySvg(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    imagePath: "ic_splash.svg",
                  ),
                  const SizedBox(height: 40),
                  MyText(
                    color: white,
                    text: "Learning App",
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
