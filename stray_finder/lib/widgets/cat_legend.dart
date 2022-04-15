import 'package:flutter/material.dart';
class Legend extends StatelessWidget {
  const Legend({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text("Cat Status", style: Theme.of(context).textTheme.bodyText1,),
          Row(
            children: [
              SizedBox(height: 20, width: 20, child: Image.asset('assets/images/cat_marker0.png'),),
              SizedBox(height: 5, width: 5,),
              Text("Normal", style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              SizedBox(height: 20, width: 20, child: Image.asset('assets/images/cat_marker1.png'),),
              SizedBox(height: 5, width: 5,),
              Text("Injured", style: Theme.of(context).textTheme.bodyText1,),
            ],
          )
        ],
      ),
    );
  }
}