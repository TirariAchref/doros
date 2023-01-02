import 'package:doros/pages/aboutus.dart';
import 'package:doros/pages/download.dart';
import 'package:doros/pages/editprofile.dart';
import 'package:doros/pages/favourite.dart';
import 'package:doros/pages/login.dart';
import 'package:doros/pages/privacypolicy.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                profileUi(),
                profileItem(),
              ],
            ),
            Positioned.fill(
              bottom: 250,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: primarylight,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 320,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: primarydark,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: MyImage(
                          width: 90,
                          height: 90,
                          imagePath: "banner1.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                        color: white,
                        text: "DivineTechs Team",
                        fontsize: 14,
                        maxline: 1,
                        fontwaight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileUi() {
    return Stack(
      children: [
        MyImage(
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.fill,
            imagePath: "banner2.jpg"),
        Positioned.fill(
          top: 40,
          left: 20,
          child: Align(
            alignment: Alignment.topLeft,
            child: MyText(
              color: white,
              text: "Profile",
              maxline: 1,
              fontwaight: FontWeight.w600,
              fontsize: 16,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.center,
              fontstyle: FontStyle.normal,
            ),
          ),
        ),
        Positioned.fill(
          top: 50,
          right: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {},
              child: MySvg(
                width: 20,
                height: 20,
                imagePath: "ic_edit.svg",
                color: white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget profileItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: primarydark,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(50)),
                child: MySvg(
                  width: 25,
                  height: 25,
                  imagePath: "ic_notification.svg",
                  color: primarydark,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              MyText(
                color: white,
                text: "Push Notification",
                maxline: 1,
                fontwaight: FontWeight.w500,
                fontsize: 14,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal,
              ),
              const Spacer(),
              // Switch Button Account Page
              FlutterSwitch(
                width: 50,
                height: 25,
                value: isSwitchOn,
                onToggle: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                  if (isSwitchOn == true) {
                    Utils().showToast("Notification On");
                  } else {
                    Utils().showToast("Notification Off");
                  }
                },
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const EditProfile();
                },
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_editprofile.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "EditProfile",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Download();
                },
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_doanload.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "Downloaded Courses",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AboutUs();
                },
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_aboutus.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "About Us",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PrivacyPolicy();
                },
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_privacypolicy.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "Privacy Policy",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Favourite();
                },
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_favourite.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "Favourite",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Dialog(
                        elevation: 16,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 25),
                              MyText(
                                color: primarydark,
                                text: "Online Learning App",
                                maxline: 1,
                                fontwaight: FontWeight.w600,
                                fontsize: 14,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal,
                              ),
                              const SizedBox(height: 15),
                              MyText(
                                color: pink,
                                text: "Are you sure want to Logout?",
                                maxline: 1,
                                fontwaight: FontWeight.w500,
                                fontsize: 14,
                                overflow: TextOverflow.ellipsis,
                                textalign: TextAlign.center,
                                fontstyle: FontStyle.normal,
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Login();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: primarydark,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: MyText(
                                        color: white,
                                        text: "Yes",
                                        maxline: 1,
                                        fontwaight: FontWeight.w500,
                                        fontsize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        textalign: TextAlign.center,
                                        fontstyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: primarydark,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: MyText(
                                        color: white,
                                        text: "Cancel",
                                        maxline: 1,
                                        fontwaight: FontWeight.w500,
                                        fontsize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        textalign: TextAlign.center,
                                        fontstyle: FontStyle.normal,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: 200,
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: MyImage(
                              width: 70,
                              height: 70,
                              imagePath: "ic_appicon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: primarydark,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: MySvg(
                    width: 25,
                    height: 25,
                    imagePath: "ic_logout.svg",
                    color: primarydark,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  color: white,
                  text: "Logout",
                  maxline: 1,
                  fontwaight: FontWeight.w500,
                  fontsize: 14,
                  overflow: TextOverflow.ellipsis,
                  textalign: TextAlign.center,
                  fontstyle: FontStyle.normal,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
