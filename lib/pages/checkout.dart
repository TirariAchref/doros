import 'package:doros/pages/bottombar.dart';
import 'package:doros/utils/color.dart';
import 'package:doros/utils/utils.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/mytext.dart';
import 'package:doros/widget/paymentmethod.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: primarydark,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: MyAppbar(
            type: 1,
            startImg: "ic_back.svg",
            startImgcolor: white,
            text: "Checkout",
            textcolor: white,
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            checkoutText(),
            paymentMethods(),
          ]),
        ),
      ),
    );
  }

  Widget checkoutText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        MyText(
          color: primarylight,
          text: "Payment Method",
          maxline: 1,
          fontwaight: FontWeight.w500,
          fontsize: 16,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal,
        ),
        const SizedBox(
          height: 5,
        ),
        MyText(
          color: gray,
          text: "Choose a payment Methods to pay",
          maxline: 1,
          fontwaight: FontWeight.w500,
          fontsize: 12,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal,
        ),
        const SizedBox(
          height: 10,
        ),
        MyText(
          color: primarydark,
          text: "Pay with",
          maxline: 1,
          fontwaight: FontWeight.w500,
          fontsize: 14,
          overflow: TextOverflow.ellipsis,
          textalign: TextAlign.center,
          fontstyle: FontStyle.normal,
        ),
      ],
    );
  }

  Widget paymentMethods() {
    return Column(
      children: [
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child:
              PaymentMethod(paymenticon: "ic_paypal.svg", methodname: "Paypal"),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child: PaymentMethod(
              paymenticon: "ic_razerpay.svg", methodname: "RazorPay"),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child:
              PaymentMethod(paymenticon: "ic_paytm.svg", methodname: "Paytm"),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child: PaymentMethod(paymenticon: "ic_upi.svg", methodname: "Upi"),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child: PaymentMethod(
              paymenticon: "ic_flutterwave.svg", methodname: "FlutterWave"),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Utils().showToast("Payment Succsessfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Bottombar();
                },
              ),
            );
          },
          child: PaymentMethod(
              paymenticon: "ic_payU.svg", methodname: "PayUMoney"),
        ),
      ],
    );
  }
}
