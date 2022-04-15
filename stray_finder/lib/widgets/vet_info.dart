import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import '../ui/map_ui.dart';

class VetInfo extends StatelessWidget {
  Map<String, dynamic> _vet;
  CustomInfoWindowController _controller;
  VetInfo(this._vet, this._controller);

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
                width: 175,
                child: Text(_vet['name'], style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis,)
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
              Text("Type: ", style: Theme.of(context).textTheme.bodyText1,),
              Text(_vet['type'], style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Address: ", style: Theme.of(context).textTheme.bodyText1,),
              Flexible(child: Text('${_vet['address']}, S${_vet['postal_code']}', style: Theme.of(context).textTheme.bodyText2,)),
            ],
          ),
          Row(
            children: [
              Text("Tel 1: ", style: Theme.of(context).textTheme.bodyText1,),
              Text(_vet['tel_office_1'], style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
          Row(
            children: [
              Text("Tel 2: ", style: Theme.of(context).textTheme.bodyText1,),
              Text(_vet['tel_office_2'], style: Theme.of(context).textTheme.bodyText2,),
            ],
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(2),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: (){
              try {
                MapUI.openMap(_vet['address']);
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