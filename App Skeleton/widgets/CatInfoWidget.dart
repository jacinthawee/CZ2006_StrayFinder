import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/MapUI.dart';

/// A Widget to show cat info window when click on the marker on Google Maps
class CatInfoWidget extends StatelessWidget {
  /// the cat to be shown
  Map<String, dynamic> _cat;
  /// a controller to show info window when clicking on the marker
  CustomInfoWindowController _controller;
  /// contructor of the class
  CatInfoWidget(this._cat, this._controller);

  /// build the widget
  @override
  Widget build(BuildContext context) {
  }
}