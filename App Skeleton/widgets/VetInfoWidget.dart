import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/MapUI.dart';

/// A widget to show vet info window on Google Maps
class VetInfoWidget extends StatelessWidget {
  /// the vet to be shown
  Map<String, dynamic> _vet;
  // a controller to show info window when clicking on the marker
  CustomInfoWindowController _controller;
  /// constructor of the class
  VetInfoWidget(this._vet, this._controller);

  /// build the widget
  @override
  Widget build(BuildContext context) {
    
  }
}