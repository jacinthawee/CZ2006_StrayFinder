import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/map_ui.dart';

class CatInfoWidget extends StatelessWidget {
  Map<String, dynamic> _cat;
  CustomInfoWindowController _controller;
  CatInfoWidget(this._cat, this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 145,
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
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(_cat['img_URL'])
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(2),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              GeoPoint pos = _cat['lastSeenLoc'];
              String dest = pos.latitude.toString() + " " + pos.longitude.toString();
              // MapUI.openMap(dest);
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