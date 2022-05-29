

/// A screen to show all cats on Google Maps
class CatMapScreen extends StatefulWidget {
}

/// State of the page
class _CatMapScreenState extends State<CatMapScreen> {
  ///A controller to control the info window that shows the description of the cat when a marker is pressed
  final CustomInfoWindowController _controller = CustomInfoWindowController();
  ///An attribute to indicate an uninjured cat's marker on a map
  late Future<Uint8List> _normalCatMarker;
///An attribute to indicate an injured cat's marker on a map
  late Future<Uint8List> _injuredCatMarker;

 

///A method to create markers for the cats on a map
  Set<Marker> _createMarkers(List<dynamic> cats, List<Uint8List> catMarker){
  
  }

  ///A method to build the page
  Widget build(BuildContext context) {
    
  }
}