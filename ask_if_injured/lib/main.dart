import 'package:flutter/material.dart';

void main(){
  runApp(const AskInjury());
}


class AskInjury extends StatelessWidget{
  const AskInjury({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white
      ),
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
        ),

      ),
        body: Center(
        child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('You Found Benson!', style: TextStyle(fontSize: 30),)
              ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/cat1.jpg'),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: const Text('Is the cat injured?', style: TextStyle(fontSize: 20),)
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
    )
    );
  }
}