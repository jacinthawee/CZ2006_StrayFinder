import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../managers/InjuryMngr.dart';

/// A widget to show a single injured cat on the noticeboard
class InjuredCatWidget extends StatelessWidget{
  /// the cat to be shown
  Map<String, dynamic> _cat;
  /// a controller to show info window when clicking on the marker
  PageController _pageViewController = PageController(initialPage: 0);
  /// constructor of the class
  InjuredCatWidget(this._cat);

  /// a method to go to cat detail page (show cat locationa and information on Google Maps)
  void _goCatDetail(BuildContext context){
  }
  /// build the widget
  @override
  Widget build(BuildContext context) {
   
  }
}