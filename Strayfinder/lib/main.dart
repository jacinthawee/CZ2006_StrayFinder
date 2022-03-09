import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFFBE44D),
          title: const Text('Report', style: TextStyle(color: Color(0xFF754E46), fontWeight: FontWeight.bold),textAlign: TextAlign.center),
        ),
        body: Center(
          child: Column(
            children:  [
              Container(width: 100, height: 90),
              Text('Please upload a picture of the stray cat you have found.', style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              Container(width: 100, height: 10),
              Container(
                margin: EdgeInsets.all(25),
                child: OutlineButton(
                  onPressed: () {},
                  color: Color(0xFF754E46),
                  borderSide: BorderSide(
                    width : 9.0,
                    color: Color(0xFF754E46),
                    style: BorderStyle.solid,
                  ),
                  child: Text('Take a Photo', style: TextStyle(fontSize: 25),textAlign: TextAlign.center),),),
              Container(width: 100, height: 10),
              Container(
                margin: EdgeInsets.all(25),
                child: OutlineButton(
                  onPressed: () {},
                  color: Color(0xFF754E46),
                  borderSide: BorderSide(
                    width : 9.0,
                    color: Color(0xFF754E46),
                    style: BorderStyle.solid,
                  ),
                  child: Text('Upload a Photo', style: TextStyle(fontSize: 25),textAlign: TextAlign.center),),),
        ],
          ),
        ),
      ),
    );
  }
}
