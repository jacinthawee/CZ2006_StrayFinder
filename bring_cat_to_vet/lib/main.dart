import 'package:flutter/material.dart';

void main() {
  runApp(const BringToVet());
}

class BringToVet extends StatelessWidget{
  const BringToVet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFFBE44D),
            iconTheme: const IconThemeData(color: Color(0xFF754E46)),
            automaticallyImplyLeading: true,
            leading: const IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null,),
            actions: const [],
            centerTitle: true,
            elevation: 4,
            title: const Text('Report', style: TextStyle(color: Color(0xFF754E46)),
        )
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 150, 10, 40),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: const Text('Are you bringing Benson to the vet yourself?', style: TextStyle(fontSize: 30),)
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconButton(icon: Icon(Icons.check_circle, color: Color(0xFF3CAC23), size: 50,), onPressed: null,),
                IconButton(icon: Icon(Icons.cancel, color: Color(0xFFC82626), size: 50,), onPressed: null,),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
