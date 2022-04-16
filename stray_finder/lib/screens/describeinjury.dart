import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'dart:io';
import '../ui/ReportUI.dart';
import '../managers/ImageMngr.dart';

class DescribeInjuryPage extends StatefulWidget {
  const DescribeInjuryPage({Key? key}) : super(key: key);

  @override
  State<DescribeInjuryPage> createState() => _DescribeInjuryPageState();
}

class _DescribeInjuryPageState extends State<DescribeInjuryPage> {
  bool showSpinner = false;
  PageController pageViewController = PageController(initialPage: 0);
  bool isSelected = false;
  late List<String> listImg;
  List<File> tempList = [];

  late String desc = "";
  var _image;
  // var _image2;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async { //gallery multiple images
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (imageFileList!.length != 0) {
      imageFileList = [];
    }
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState((){});
  }
  Future chooseImage() async{ //camera
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (imageFileList!.length != 0) {
        imageFileList = [];
      }
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Future chooseImageGallery() async{
  //   final image2 = await picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (image2 != null) {
  //       _image2 = File(image2.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final name = routeArgs['name'];
    final lastSeen = routeArgs['lastSeen'];
    // final breed = routeArgs['breed'];
    // final injury = routeArgs['injuryStatus'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),

      ),
      body: SingleChildScrollView(
        child: Center(
      child: showSpinner
      ? Padding(
      padding: EdgeInsets.fromLTRB(0, 350, 0, 0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container (
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('Please upload a picture of the injury:', style: TextStyle(fontSize: 22, fontFamily: "Poppins"), textAlign: TextAlign.center,),
                  Text('To select multiple pictures, please upload them from your camera gallery. Swipe left to see all the pictures you uploaded in the display below.', style: TextStyle(fontSize: 15, fontFamily: "Poppins"), textAlign: TextAlign.center,),
                ],
              ),
            ),
            Container (
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  isSelected == false ?
                  IconButton(onPressed:() {setState(() {
                    isSelected = true;
                  });
                  }, icon: Icon(Icons.add_a_photo, color: Color(0xFF754E46),), iconSize: 50,)
 : Column(
    children: [Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                        child: Center(child: (imageFileList!.length >0) ?
    SizedBox(
      child:
      Stack(
        children: [PageView(
        controller: pageViewController,
        scrollDirection: Axis.horizontal,
        children: [
        for (var i = 0; i<imageFileList!.length; i++)

          Image.file(
            File(imageFileList![i].path),
          fit: BoxFit.cover,
          ),

        ],

        ),
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Padding(
              padding:
              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: SmoothPageIndicator(
                controller: pageViewController,
                count: imageFileList!.length,
                axisDirection: Axis.horizontal,
                onDotClicked: (i) {
                  pageViewController.animateToPage(
                    i,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  spacing: 8,
                  radius: 8,
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Color(0xFF9E9E9E),
                  activeDotColor: Theme.of(context).primaryColor,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),

        ],
      ),
    )


                            : (_image != null )? Image.file(_image) :
                        Text("No image found")),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, spreadRadius: 1),
                          ],
                        ),
                        height: 300,
                        width: 300
                    ),
                  ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: TextButton.icon(
                          icon: Icon(Icons.camera_alt , color:Colors.white ),
                          label: Text('Take Photo',
                              style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                          onPressed: () => chooseImage(),
                          style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff754E46)),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.fromLTRB(60, 10, 60, 10)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)))),

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextButton.icon(
                          icon: Icon(Icons.photo, color:Colors.white ),
                          label: Text('Upload Photo',
                              style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
                          onPressed: () => selectImages(),
                          style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff754E46)),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.fromLTRB(50, 10, 50, 10)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)))),

                        ),
                      ),
                      // Padding(
                      //     padding: EdgeInsets.fromLTRB(20, 10, 40, 0),
                      //     child: (_image != null || _image2 != null) ? IconButton(icon: Icon(Icons.check_circle, color: Color(0xFF3CAC23), size: 50,),
                      //         onPressed: () {
                      //           ReportUI.goToIsThisTheCatPage(context);
                      //         }) : Container()
                      // ),

                    ],
                  ),
    ],
              ),
            ),
            Container (
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              alignment: Alignment.center,
              child: Column(
                children: const [
                  Text('Describe the injury: (Optional)', style: TextStyle(fontSize: 22, fontFamily: "Poppins"), textAlign: TextAlign.center),
                ],
              ),
            ),
            Container (
              width:350,
              alignment: Alignment.center,
              child: Column(
                children:  [
                  TextField(
                    keyboardType: TextInputType.multiline,
                    onChanged: (value)
                    {desc = value;},
                    maxLines: 12,
                    obscureText: false,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff754E46)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff754E46)),
                      ),
                      filled: true,),
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container (
              padding: EdgeInsets.fromLTRB(250, 50, 20, 70),
              child: Column(
                children: [
                  (_image != null || imageFileList!.length >0) ? TextButton(onPressed: () async{

                    setState(() {
                      showSpinner = true;
                    });

                    if (_image != null)
                    {
                      DocumentReference imgRef = FirebaseFirestore.instance.collection('images').doc();
                      String imgURL = await ImageMngr.saveImg(_image, imgRef);
                      listImg.add(imgURL);
                      ReportUI.goBringToVet(context, id, desc, listImg, name, lastSeen);
                    }

                    else
                      {
                        for (var i in imageFileList!)
                          {tempList.add(File(i.path));
                          }
                        DocumentReference imgRef = FirebaseFirestore.instance.collection('images').doc();
                        List<String> imgURLs = await ImageMngr.saveImgs(tempList, imgRef);
                        listImg = imgURLs;
                        ReportUI.goBringToVet(context, id, desc, listImg, name, lastSeen);
                      }
                    setState(() {
                      showSpinner = false;
                    });


    // setState(() {
    //   showSpinner = false;
    // });
                  }, child: const Text('Continue', style: TextStyle(fontSize: 20, fontFamily: "Poppins"),),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:

                          MaterialStateProperty.all<Color>(Color(0xff754E46)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))))
                      :
                  TextButton(onPressed: null, child: const Text('Continue', style: TextStyle(fontSize: 20, fontFamily: "Poppins"),),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.fromLTRB(20, 10, 20, 10)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:

                          MaterialStateProperty.all<Color>(Colors.grey),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)))))

                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      });
}


