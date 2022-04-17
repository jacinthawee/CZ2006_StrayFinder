import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/MapUI.dart';

/// A widget to show injured cat info window on Google Maps
class InjuryInfoWidget extends StatelessWidget{
  /// the cat to be shown
  Map<String, dynamic> _cat;
  /// a controller to show info window when clicking on the marker
  CustomInfoWindowController _controller;
  /// Constructor of the class
  InjuryInfoWidget(this._cat, this._controller);
  /// build the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 140,
                child: Text(_cat['cat_name'], style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis,)
              ),
              IconButton(
                onPressed: _controller.hideInfoWindow, 
                icon: Icon(Icons.close),
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero
              )
            ],
          ),
          Row(
            children: [
              Text("Passerby Name: ", style: Theme.of(context).textTheme.bodyText1,),
              Text(_cat['passerby_name'], style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
          Row(
            children: [
              Text("Contact: ", style: Theme.of(context).textTheme.bodyText1,),
              Text(_cat['passerby_hp'], style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(2),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              GeoPoint pos = _cat['lastSeen'];
              String dest = pos.latitude.toString() + " " + pos.longitude.toString();
              try {
                MapUI.openMap(dest);
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(
                        "Could not launch Google Maps. Please make sure Google Maps is installed and is connected to Internet"),
                      actions: [
                        TextButton(
                          onPressed: ()=>Navigator.pop(ctx),
                          child: Text("OK",
                              style: TextStyle(color: Color(0xff754E46))),
                        )
                      ],
                    );
                  },
                );
              }
            }, 
            icon: Icon(Icons.directions_rounded, color: Theme.of(context).colorScheme.secondary, size:20), 
            label: const Text("Open Google Maps", style: TextStyle(color: Color(0xFF754E46),fontSize:12,fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}