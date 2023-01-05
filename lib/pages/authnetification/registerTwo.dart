import 'package:doros/pages/bottombar.dart';
import 'package:doros/pages/authnetification/login.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/myedittext.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mysvg.dart';
import 'package:doros/widget/mytext.dart';
import 'package:doros/widget/suffixedittext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTwo extends StatefulWidget {
  const RegisterTwo({Key? key}) : super(key: key);

  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conpasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Al khor';
  String dropdownvalue2 = 'Student';
  var items = [
    'Al khor',
    'Al Khartiyat',
    'Tunisia',
    'Dubai',
    'Algeria',
  ];
  var cat = [
    'Student',
    'Teacher',
  ];
  late String? _email;
  late String? _password = '';
  late String? _conpassword = '';
  late String? _phone;
  late bool? _hasPasswordmatch = false;
  int _selectedValue = 0;

  onPasswordmat(String password, String pass) {
    setState(() {
      _hasPasswordmatch = false;
      if (_password == _conpassword) _hasPasswordmatch = true;
    });
  }

  bool obscureTextPassword = true;
  bool obscureTextConPassword = true;
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
            controller: emailController,
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
                  imagePath: "ic_email.png",
                  width: 20,
                ),
              ),
              hintText: "email",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
            obscureText: false,
            onSaved: (String? value) {
              _email = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Email is Required';
              }

              if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
                return 'Please enter a valid email Address';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (password) {
              setState(() {
                _password = password;
                onPasswordmat(_password!, _conpassword!);
              });
            },
            onSaved: (String? value) {
              _password = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }

              if (value.length < 8) {
                return 'At least 8 characters';
              }
              if (_hasPasswordmatch == false) return 'Password Must match';

              return null;
            },
            obscureText: obscureTextPassword,
            keyboardType: TextInputType.number,
            controller: passwordController,
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
                      color: lowercolorintro,
                    ),
                  ),
                ),
              ),
              hintText: "Password",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (password) {
              setState(() {
                _conpassword = password;
                onPasswordmat(_password!, _conpassword!);
              });
            },
            onSaved: (String? value) {
              _conpassword = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }

              if (value.length < 8) {
                return 'At least 8 characters';
              }

              if (_hasPasswordmatch == false) return 'Password Must match';

              return null;
            },
            obscureText: obscureTextConPassword,
            keyboardType: TextInputType.number,
            controller: conpasswordController,
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
                      color: lowercolorintro,
                    ),
                  ),
                ),
              ),
              hintText: "Confirmation Password",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: phoneController,
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
                  imagePath: "ic_mobile.png",
                  width: 20,
                ),
              ),
              hintText: "Phone Number",
              hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: lowercolorintro,
                  fontWeight: FontWeight.w500),
            ),
            obscureText: false,
            onSaved: (String? value) {
              _phone = value;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Phone is Required';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyText(
                        color: lowercolorintro,
                        text: "Location :",
                        fontsize: 14,
                        fontwaight: FontWeight.w400,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButton(
                      dropdownColor: upperlight,
                      style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          color: lowercolorintro,
                          fontWeight: FontWeight.w500 //<-- SEE HERE
                          ),

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyText(
                        color: lowercolorintro,
                        text: "You want to be :",
                        fontsize: 14,
                        fontwaight: FontWeight.w400,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textalign: TextAlign.center,
                        fontstyle: FontStyle.normal),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButton(
                      dropdownColor: upperlight,
                      style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          color: lowercolorintro,
                          fontWeight: FontWeight.w500 //<-- SEE HERE
                          ),

                      // Initial Value
                      value: dropdownvalue2,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: cat.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue2 = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget signUpBtn() {
    return InkWell(
      onTap: () {
        print(dropdownvalue + dropdownvalue2);
        if (_keyForm.currentState!.validate()) {
          _keyForm.currentState!.save();
          print(dropdownvalue + dropdownvalue2);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Bottombar();
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
