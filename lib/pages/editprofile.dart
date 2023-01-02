import 'dart:developer';
import 'dart:io';

import 'package:doros/utils/color.dart';
import 'package:doros/widget/appbar.dart';
import 'package:doros/widget/myimage.dart';
import 'package:doros/widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var imageFile;
  final ImagePicker picker = ImagePicker();

  getImageFromGallery() async {
    var image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
        // ignore: unnecessary_brace_in_string_interps
        debugPrint("Image Path:${imageFile}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydark,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: primarydark,
        title: MyAppbar(type: 1, startImg: "ic_back.svg", startImgcolor: white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: primarydark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 180,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: pink, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    child: InkWell(
                      onTap: () {
                        getImageFromGallery();
                        log("Click Image");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: imageFile == null
                            ? MyImage(
                                width: 150,
                                height: 150,
                                imagePath: "banner1.jpg",
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyText(
                      color: white,
                      fontwaight: FontWeight.w600,
                      fontsize: 16,
                      overflow: TextOverflow.ellipsis,
                      maxline: 1,
                      text: "Vraj Raval",
                      textalign: TextAlign.center,
                      fontstyle: FontStyle.normal),
                ],
              ),
            ),
            const SizedBox(height: 10),
            MyText(
                color: white,
                fontwaight: FontWeight.w600,
                fontsize: 14,
                overflow: TextOverflow.ellipsis,
                maxline: 1,
                text: "Edit name",
                textalign: TextAlign.center,
                fontstyle: FontStyle.normal),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Vraj Raval",
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      color: primarydark,
                      fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    color: pink, borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: MyText(
                    color: white,
                    fontwaight: FontWeight.w600,
                    fontsize: 14,
                    overflow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: "Save",
                    textalign: TextAlign.center,
                    fontstyle: FontStyle.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
