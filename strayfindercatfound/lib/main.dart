import 'package:flutter/material.dart';

void main(){
  runApp(const NameCatFound());
}


class NameCatFound extends StatelessWidget{
  const NameCatFound({Key? key}) : super(key: key);

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
                Container(width: 100, height: 50),

                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: const Text('Please give a name to the cat that you have found!', style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
                ),

                Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,0,0,0),
                            child: Text('Name: ', style: TextStyle(fontSize:20),))),
                    Flexible(
                      child: SizedBox(
                        width: 600,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18.0,),
                            hintText: "Don't use rude words!",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(width: 100, height: 20),
                Container(
                    child: ElevatedButton(
                      child: const Text('CONFIRM NAME'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF754E46),
                        minimumSize: const Size(250,50)
                      ),
                      onPressed: () {print('');},)
                )
              ],
            ),
          ),
        )
    );
  }
}