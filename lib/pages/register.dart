import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/login.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myedittext.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:doros/widget/suffixedittext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conpasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextConPassword = true;

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
                  registerUi(),
                  registerField(),
                  const Spacer(),
                  signUpBtn(),
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

  Widget registerUi() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20),
      child: MyText(
          color: white,
          text: "Register",
          fontsize: 20,
          fontwaight: FontWeight.w600,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

  Widget registerField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyEdittext(
              hintcolor: pink,
              hinttext: "email",
              keyboardType: TextInputType.text,
              controller: emailController,
              size: 14,
              textcolor: white,
              textInputAction: TextInputAction.next,
              obscureText: false),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: obscureTextPassword,
            keyboardType: TextInputType.number,
            controller: passwordController,
            textInputAction: TextInputAction.next,
            cursorColor: white,
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
                  height: 20,
                  imagePath: "ic_password.png",
                  width: 20,
                ),
              ),
              suffixIcon: Container(
                width: 5,
                height: 5,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      obscureTextPassword = !obscureTextPassword;
                    });
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: MySvg(
                      height: 20,
                      imagePath: obscureTextPassword
                          ? "ic_notvisible.svg"
                          : "ic_visible.svg",
                      width: 20,
                      color: pink,
                    ),
                  ),
                ),
              ),
              hintText: "Password",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: pink,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: obscureTextConPassword,
            keyboardType: TextInputType.number,
            controller: conpasswordController,
            textInputAction: TextInputAction.next,
            cursorColor: white,
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
                  height: 20,
                  imagePath: "ic_password.png",
                  width: 20,
                ),
              ),
              suffixIcon: Container(
                width: 5,
                height: 5,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      obscureTextConPassword = !obscureTextConPassword;
                    });
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: MySvg(
                      height: 20,
                      imagePath: obscureTextConPassword
                          ? "ic_notvisible.svg"
                          : "ic_visible.svg",
                      width: 20,
                      color: pink,
                    ),
                  ),
                ),
              ),
              hintText: "Password",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: pink,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          SuffixEdittext(
              hintcolor: pink,
              hinttext: "Mobile No",
              prefixicon: "ic_mobile.png",
              suffixtext: "(+91)",
              keyboardType: TextInputType.number,
              controller: numberController,
              size: 14,
              textcolor: white,
              textInputAction: TextInputAction.done,
              obscureText: false),
        ],
      ),
    );
  }

  Widget signUpBtn() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Bottombar();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        alignment: Alignment.center,
        decoration:
            BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
        child: MyText(
            color: white,
            text: "SIGN UP",
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
              return const Login();
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
                text: "Already have an Account ?",
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
                text: "Login",
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
}
