import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/mobilelogin.dart';
import 'package:doros/pages/register.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myedittext.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextPassword = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [uppercolorintro, lowercolorintro])),
          child: Stack(
            children: [
              Column(
                children: [
                  loginUi(),
                  emailAndpassword(),
                  forgotPassword(),
                  loginBtn(),
                  goingRegister(),
                  const Spacer(),
                  mobileLogin(),
                  loginGoogleFacebook(),
                  const SizedBox(height: 20)
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

  Widget loginUi() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20),
      child: MyText(
          color: white,
          text: "Login",
          fontsize: 20,
          fontwaight: FontWeight.w600,
          maxline: 1,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

  Widget emailAndpassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          TextFormField(
            obscureText: obscureTextPassword,
            keyboardType: TextInputType.number,
            controller: passwordController,
            textInputAction: TextInputAction.done,
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
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: MyText(
          color: pink,
          text: "Forgot Password ?",
          fontsize: 12,
          maxline: 1,
          fontwaight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal),
    );
  }

  Widget loginBtn() {
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
        height: 100,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: BoxDecoration(
            color: pink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MyText(
              color: white,
              text: "SIGN IN",
              fontsize: 16,
              fontwaight: FontWeight.w600,
              maxline: 1,
              overflow: TextOverflow.ellipsis,
              textalign: TextAlign.center,
              fontstyle: FontStyle.normal),
        ),
      ),
    );
  }

  Widget goingRegister() {
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
        height: 20,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
                color: pink,
                text: "Dont't have an Account ?",
                fontsize: 13,
                maxline: 1,
                fontwaight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
            const SizedBox(
              width: 5,
            ),
            MyText(
                color: white,
                text: "Register",
                fontsize: 13,
                maxline: 1,
                fontwaight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
          ],
        ),
      ),
    );
  }

  Widget mobileLogin() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MobileLogin();
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
          color: primarydark,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MyText(
            color: white,
            text: "Sign In with mobile no",
            fontsize: 16,
            fontwaight: FontWeight.w600,
            maxline: 1,
            overflow: TextOverflow.ellipsis,
            textalign: TextAlign.center,
            fontstyle: FontStyle.normal),
      ),
    );
  }

  Widget loginGoogleFacebook() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 145,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyImage(width: 20, height: 20, imagePath: "ic_gmail.png"),
                const SizedBox(
                  width: 5,
                ),
                MyText(
                    color: primarydark,
                    text: "Google",
                    fontsize: 14,
                    fontwaight: FontWeight.w600,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ],
            ),
          ),
          Container(
            width: 145,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyImage(width: 20, height: 20, imagePath: "ic_facebook.png"),
                const SizedBox(
                  width: 5,
                ),
                MyText(
                    color: primarydark,
                    text: "Facebook",
                    fontsize: 14,
                    fontwaight: FontWeight.w600,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
