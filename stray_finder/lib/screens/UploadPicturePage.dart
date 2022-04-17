import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import '../ui/ReportUI.dart';
import '../managers/ImageMngr.dart';

/// A page where the user will take picture or upload picture of the cat they want to report
class UploadPicturePage extends StatefulWidget {
  @override
  _UploadPicturePageState createState() => _UploadPicturePageState();
}

/// state of the page
class _UploadPicturePageState extends State<UploadPicturePage> {
  /// show spinner when the page is loading
  bool showSpinner = false;
  /// A `File` that represent the photo taken from camera when user click 'take photo'
  var _image;
  /// A `File` that represent the uploaded image when user select from their gallery
  var _image2;
  /// allow users to select picture to upload from gallery
  final picker = ImagePicker();

  /// A method to generate `File` from the photo taken by user
  Future<void> chooseImage() async {
    final image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (_image2 != null) {
        _image2 = null;
      }
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  /// A method to generate `File` from the photo selected from gallery by user
  Future<void> chooseImageGallery() async {
    final image2 = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image2 != null) {
        _image2 = File(image2.path);
      } else {
        print('No image selected.');
      }
    });
  }
  /// build the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: showSpinner
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 350, 0, 0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Container(width: 100, height: 50),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Text(
                        'Please upload a picture of the stray cat you found',
                        style: TextStyle(fontSize: 25, fontFamily: "Poppins"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                          child: Center(
                              child: (_image2 != null)
                                  ? Image.file(_image2)
                                  : (_image != null)
                                      ? Image.file(_image)
                                      : Text("No image found")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.black, spreadRadius: 1),
                            ],
                          ),
                          height: 300,
                          width: 350),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: TextButton.icon(
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text('Take Photo',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Poppins")),
                            onPressed: () => chooseImage(),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff754E46)),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(60, 10, 60, 10)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextButton.icon(
                            icon: Icon(Icons.photo, color: Colors.white),
                            label: Text('Upload Photo',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Poppins")),
                            onPressed: () => chooseImageGallery(),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff754E46)),
                                padding:
                                    MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(50, 10, 50, 10)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)))),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 40, 0),
                            child: (_image != null || _image2 != null)
                                ? Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: Color(0xFF3CAC23),
                                          size: 50,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            showSpinner = true;
                                          });
                                          if (_image != null) {
                                            String result = await ReportUI.checkCat(_image);

                                            if (result == 'error') showAlertDialog(context);
                                            else {
                                              String breed =
                                                await ReportUI.predictBreed(
                                                    _image);
                                            DocumentReference imgRef =
                                                FirebaseFirestore.instance
                                                    .collection('images')
                                                    .doc();
                                            String imgURL = await ImageMngr
                                                .saveImg(_image, imgRef);

                                            ReportUI.goToIsThisTheCatPage(
                                                context, imgURL, breed);
                                            
                                            }
                                          } else if (_image2 != null) {
                                            String result = await ReportUI.checkCat(_image2);
                                            if (result == 'error') showAlertDialog(context);
                                            else{
                                              String breed =
                                                await ReportUI.predictBreed(
                                                    _image2);
                                              // print(breed);
                                              DocumentReference imgRef =
                                                  FirebaseFirestore.instance
                                                      .collection('images')
                                                      .doc();
                                              String imgURL = await ImageMngr
                                                  .saveImg(_image2, imgRef);

                                              ReportUI.goToIsThisTheCatPage(
                                                  context, imgURL, breed);
                                              print(breed);
                                            }
                                          }

                                          setState(() {
                                            showSpinner = false;
                                          });
                                        }
                                        // catch (e) {
                                        //   showAlertDialog(context);
                                        // }
                                        // setState(() {
                                        //   showSpinner = false;
                                        //       // });
                                        // }

                                        ),
                                  )
                                : Container()),
                      ],
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(25),
                    //   child: OutlineButton(
                    //     onPressed: () {},
                    //     color: Color(0xFF754E46),
                    //     borderSide: BorderSide(
                    //       width : 9.0,
                    //       color: Color(0xFF754E46),
                    //       style: BorderStyle.solid,
                    //     ),
                    //     child: Text('Upload a Photo', style: TextStyle(fontSize: 25),textAlign: TextAlign.center),),),
                  ],
                ),
        ),
      ),
    );
  }
}

/// show dialog box for error message
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle(color: Color(0xff754E46))),
    onPressed: () {
      Navigator.pop(context, '/uploadpicture');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    // content: Text("Please try again later"),
    content: Text("Please use a cat image"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

