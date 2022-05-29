

///A page that prompts the user to describe the injury and upload pic of the injury if they specify the cat newly found to be injured
class DescribeInjuryPage extends StatefulWidget {
}

/// State of the page
class _DescribeInjuryPageState extends State<DescribeInjuryPage> {
  
  ///An attribute to show if the loading spinner is shown or not
  bool showSpinner = false;

  ///A controller to allow multiple pictures to be scrollable
  PageController pageViewController = PageController(initialPage: 0);

  ///An attribute to know if the camera icon is selected or not
  bool isSelected = false;

  ///An attribute indicating a list of image urls
  late List<String> listImg;

  ///An attribute indicating a list of images in File
  List<File> tempList = [];

  ///An attribute that indicates the description uploaded
  late String desc = "";

  ///An attribute that indicates the image uploaded
  var _image;

  ///An imagepicker that allows the user to pick images from camera/gallery
  final ImagePicker imagePicker = ImagePicker();

  ///An attribute indicating a list of images in XFile
  List<XFile>? imageFileList = [];

  ///A method to allow users to pick multiple pictures from the gallery
  void selectImages() async { //gallery multiple images
   
  }

  ///A method to allow users to take a picture via the camera
  Future<void> chooseImage() async{ //camera
    
  }
  ///A method to build the page
  Widget build(BuildContext context) {
  }
}

///A method to show the loading spinner in order to inform the user that the page is loading
buildShowDialog(BuildContext context) {
 
}


