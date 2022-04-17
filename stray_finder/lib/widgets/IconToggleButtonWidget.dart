import 'package:flutter/material.dart';

/// A widget that shows a cat image and a toggle button below to allow user to select
class IconToggleButtonWidget extends StatefulWidget {
  /// whether the button is selected
  bool isSelected = false;
  /// the corresponding cat whose image will be shown
  Map<String, dynamic> cat;
  /// constructor of the class
  IconToggleButtonWidget(this.cat);

  @override
  State<IconToggleButtonWidget> createState() => _IconToggleButtonWidgetState();

}
/// state of the widget
class _IconToggleButtonWidgetState extends State<IconToggleButtonWidget> {

  /// build the widget
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
                child: (widget.isSelected == true)
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