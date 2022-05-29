import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import '../widgets/VetInfoWidget.dart';
import '../managers/VetMngr.dart';
import '../ui/MapUI.dart';

/// A class that show all vets on Google Maps
class VetScreen extends StatefulWidget {
  const VetScreen({Key? key}) : super(key: key);

  @override
  _VetScreenState createState() => _VetScreenState();
}
/// state of the page
class _VetScreenState extends State<VetScreen> {
  /// control the open/close state of the floating button
  ValueNotifier<bool> _isDialOpen = ValueNotifier(false);
  /// a controller to show info window when clicking on the marker
  final CustomInfoWindowController _controller = CustomInfoWindowController();
  /// indicating whether the query of vets data is finished
  late Future<bool> _hasVetData;
  /// indicating whether the ver marker is loaded
  late Future<Uint8List> _vetMarker;
  /// contains marker of all vets
  Set<Marker> _markers = {};

  /// A method to create markers for all vets
  Set<Marker> _createMarkers(List<dynamic> vets, Uint8List vetMarker) {
    
  }

  /// build the page
  @override
  Widget build(BuildContext context) {
  }
}
