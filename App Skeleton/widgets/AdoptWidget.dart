import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../classes/AdoptOrg.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget to show a single adoption centre
class AdoptWidget extends StatelessWidget{
  /// the adopt center to show
  AdoptOrg adopt;
  /// a controller that allows multiple pictures to be scrollable
  PageController pageViewController = PageController(initialPage: 0);

  /// construtor of the class
  AdoptWidget(this.adopt);

  /// build the widget
  @override
  Widget build(BuildContext context) {

  }
  /// a method to lauch website of the adoption centre
  void goWebsite() async{

  }

}
