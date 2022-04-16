
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../managers/StrayCatMngr.dart';

class IconToggleButton extends StatefulWidget {
  bool isSelected = false;
  bool isDisabled = false;
  Map<String, dynamic> cat;
  // String name;
  // int catID = -1;
  IconToggleButton(this.cat);




  @override
  State<IconToggleButton> createState() => _IconToggleButtonState();

}

class _IconToggleButtonState extends State<IconToggleButton> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      child:
      Column(
        children: [
          Image.network(
           widget.cat['img_URL'],
            width: 150,
              height: 150,
          ),
          IconButton(
            iconSize: 20.0,
            padding: EdgeInsets.all(5),
            icon: Padding(
                padding: EdgeInsets.zero,
                child: (widget.isSelected == true && widget.isDisabled == false)
                    ? Icon(Icons.check_circle_rounded )
                    : Icon(Icons.circle_outlined)),
            onPressed: () {
              setState(() {
                widget.isSelected = (!widget.isSelected);});

              }
          ),
        ],
      ),
    );
  }
}