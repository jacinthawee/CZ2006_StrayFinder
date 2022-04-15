import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/cat_map_ui.dart';
import '../ui/vet_ui.dart';

class CatInfo extends StatelessWidget {
  Map<String, dynamic> _cat;
  CustomInfoWindowController _controller;
  CatInfo(this._cat, this._controller);

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
          // Row(
          //   children: [
          //     Image.network(_cat['cat_img']),
          //     Text("Breed: ", style: Theme.of(context).textTheme.bodyText1,),
          //     Text(_cat['cat_breed'], style: Theme.of(context).textTheme.bodyText2,),
          //   ],
          // ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text("Injured: ", style: Theme.of(context).textTheme.bodyText1,),
          //     Flexible(child: Text('${_cat['is_injured']}', style: Theme.of(context).textTheme.bodyText2,)),
          //   ],
          // ),
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(2),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              GeoPoint pos = _cat['lastSeenLoc'];
              String dest = pos.latitude.toString() + " " + pos.longitude.toString();
              CatMapUI.openMap(dest);
            },
            icon: Icon(Icons.directions_rounded, color: Theme.of(context).colorScheme.secondary, size:20), 
            label: const Text("Open Google Maps", style: TextStyle(color: Color(0xFF754E46),fontSize:12,fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}