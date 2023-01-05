import 'dart:developer';

import 'package:country_codes/country_codes.dart';
import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/authnetification/register.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => MobileLoginState();
}

class MobileLoginState extends State<MobileLogin> {
  TextEditingController numberController = TextEditingController();
  final otpController = TextEditingController();


  String? verificationId;
  bool isvisibile = true;
  Locale? countrycode;
  CountryDetails? code;

  @override
  void initState() {
    super.initState();
    dialcode();
  }

  dialcode() async {
    await CountryCodes.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarylight,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [uppercolorintro, lowercolorintro])),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
                  mobileloginText(),
                  const SizedBox(height: 70),
                  mobileloginchildText(),
                  const SizedBox(height: 70),
                  enterNumber(),
                  const SizedBox(height: 20),
                  resendText(),
                  const Spacer(),
                  sendOTP(),
                  registerText(),
                  const Spacer(),
                ],
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
      ),
    );
  }

// Mobile number Page UI
  Widget mobileloginText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: MyText(
          color: white,
          text:
              isvisibile == true ? "Enter Your Mobile No" : "OTP Verification",
          fontsize: 18,
          fontwaight: FontWeight.w600,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

  Widget mobileloginchildText() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: MyText(
          color: pink,
          text: isvisibile == true
              ? "You Will receive a 6 digitcode to verify next"
              : "Enter OTP code to Sent to Mobile No ",
          fontsize: 14,
          fontwaight: FontWeight.w400,
          maxline: 2,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

  Widget enterNumber() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: isvisibile == true
          ? TextFormField(
              obscureText: false,
              keyboardType: TextInputType.number,
              controller: numberController,
              textInputAction: TextInputAction.done,
              cursorColor: white,
              onChanged: (value) {
                setState(() {
                  Locale deviceLocale = CountryCodes.getDeviceLocale()!;
                  Locale myLocale = Localizations.localeOf(context);
                  CountryDetails details =
                      CountryCodes.detailsForLocale(myLocale);

                  countrycode = deviceLocale;
                  code = details;
                  log("Country Code =============${countrycode?.languageCode}");
                  log("dieal Code =============${code?.dialCode}");
                  log("Country Code =============${countrycode?.countryCode}");
                  log("dieal Code =============${code?.name}");
                  log("dieal Code =============${code?.alpha2Code}");
                  log("dieal Code =============${code?.localizedName}");
                });
              },
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: white,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: black)),
                prefixIcon: Container(
                    width: 5,
                    height: 5,
                    alignment: Alignment.center,
                    child: MyImage(
                      width: 25,
                      height: 25,
                      imagePath: "ic_mobile.png",
                      color: pink,
                    )),
                suffixText: code?.dialCode,
                hintText: "Mobile No",
                hintStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    color: primarylight,
                    fontWeight: FontWeight.w500),
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          /*    child: Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                controller: otpController,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    textStyle: GoogleFonts.inter(
                      color: white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    )),
              ),*/
            ),
    );
  }

  Widget resendText() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: MyText(
                color: white,
                text: isvisibile == true ? "" : "Resend",
                fontsize: 14,
                fontwaight: FontWeight.w600,
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
          ),
        ),
      ),
    );
  }

  Widget sendOTP() {
    return InkWell(
      onTap: () {
        if (isvisibile == true) {
          setState(() {
            isvisibile = false;
          });
        } else {
          // CALL LOGIN API and after navigate HomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Bottombar();
              },
            ),
          );
          Utils().showToast("Login Succsessfully");
        }
      },
      child: Container(
        width: isvisibile == true ? 150 : 250,
        height: 50,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
        child: MyText(
            color: white,
            text: isvisibile == true ? "SEND OTP" : "Verify & Process",
            fontsize: 14,
            fontwaight: FontWeight.w500,
            maxline: 1,
            overflow: TextOverflow.ellipsis,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
      ),
    );
  }

  Widget registerText() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Register();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
                color: pink,
                text: "Don't have an Account ?",
                fontsize: 14,
                fontwaight: FontWeight.w400,
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
            const SizedBox(
              width: 5,
            ),
            MyText(
                color: white,
                text: "Register",
                fontsize: 14,
                fontwaight: FontWeight.w400,
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
          ],
        ),
      ),
    );
  }

  /// Otp Verification Methods
  Future<void> phoneSignIn({required String phoneNumber}) async {
   
  }

  


  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;

    log("forece Token ==========>:${forceResendingToken.toString()}");
    log("Verification Id: ======>$verificationId");
    Utils().showToast("OTP Sent Succsessfully");
    setState(() {
      isvisibile = false;
    });
    log("isvisible $isvisibile");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {});
  }
}
