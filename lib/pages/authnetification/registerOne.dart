import 'package:doros/pages/authnetification/registerTwo.dart';
import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/authnetification/login.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myedittext.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:doros/widget/suffixedittext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterOne extends StatefulWidget {
  const RegisterOne({Key? key}) : super(key: key);

  @override
  State<RegisterOne> createState() => _RegisterOneState();
}

class _RegisterOneState extends State<RegisterOne> {
  TextEditingController NameController = TextEditingController();
  TextEditingController ArbicNameController = TextEditingController();

  late String? _FullName;
  late String? _FullNameArabic;

  var selectedValue = ExtraTopping.yes;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarylight,
      body: Form(
        key: _keyForm,
        child: SingleChildScrollView(
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
                    const Spacer(),
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
          color: lowercolorintro,
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
          TextFormField(
            keyboardType: TextInputType.text,
            controller: NameController,
            textInputAction: TextInputAction.next,
            cursorColor: lowercolorintro,
            style: GoogleFonts.montserrat(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: lowercolorintro,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: lowercolorintro),
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: black)),
              prefixIcon: Container(
                width: 5,
                height: 5,
                alignment: Alignment.center,
                child: MyImage(
                  color: lowercolorintro,
                  height: 20,
                  imagePath: "ic_account.png",
                  width: 20,
                ),
              ),
              hintText: "Full Name In English",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
            obscureText: false,
            onSaved: (String? value) {
              _FullName = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: ArbicNameController,
            textInputAction: TextInputAction.next,
            cursorColor: lowercolorintro,
            style: GoogleFonts.montserrat(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: lowercolorintro,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: lowercolorintro),
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: black)),
              prefixIcon: Container(
                width: 5,
                height: 5,
                alignment: Alignment.center,
                child: MyImage(
                  color: lowercolorintro,
                  height: 20,
                  imagePath: "ic_account.png",
                  width: 20,
                ),
              ),
              hintText: "Full Name In Arabic",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
            obscureText: false,
            onSaved: (String? value) {
              _FullNameArabic = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Arabic Name is Required';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: MyText(
                color: lowercolorintro,
                text: "Gender :",
                fontsize: 14,
                fontwaight: FontWeight.w400,
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
          ),
          RadioListTile<ExtraTopping>(
              activeColor: lowercolorintro,
              title: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                    color: lowercolorintro,
                    text: "Male",
                    fontsize: 14,
                    fontwaight: FontWeight.w400,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ),
              value: ExtraTopping.yes,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
          RadioListTile<ExtraTopping>(
              activeColor: lowercolorintro,
              title: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                    color: lowercolorintro,
                    text: "Female",
                    fontsize: 14,
                    fontwaight: FontWeight.w400,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ),
              value: ExtraTopping.no,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget signUpBtn() {
    return InkWell(
      onTap: () {
        if (_keyForm.currentState!.validate()) {
          _keyForm.currentState!.save();
          if (selectedValue == ExtraTopping.yes) {
            print(selectedValue.toString());
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const RegisterTwo();
              },
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: lowercolorintro, borderRadius: BorderRadius.circular(10)),
        child: MyText(
            color: uppercolorintro,
            text: "Next Step",
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
                color: lowercolorintro,
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
                color: uppercolorintro,
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

enum ExtraTopping { yes, no }
