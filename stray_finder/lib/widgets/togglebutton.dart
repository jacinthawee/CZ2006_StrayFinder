import 'package:flutter/material.dart';

class IconToggleButtonWidget extends StatefulWidget {
  bool isSelected = false;
  bool isDisabled = false;
  Map<String, dynamic> cat;
  // String name;
  // int catID = -1;
  IconToggleButtonWidget(this.cat);




  @override
  State<IconToggleButtonWidget> createState() => _IconToggleButtonWidgetState();

}

class _IconToggleButtonWidgetState extends State<IconToggleButtonWidget> {
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