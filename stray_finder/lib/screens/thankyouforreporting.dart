import 'package:flutter/material.dart';
import '../ui/ReportUI.dart';

class ThankYouForReportingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Report",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(20, 250, 10, 40),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Thank you for reporting!', style: TextStyle(fontSize: 30, fontFamily: "Poppins"), textAlign: TextAlign.center,)
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff754E46)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(70, 10, 70, 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)))),
              child: Text('Report more cats',
                  style: TextStyle(fontSize: 20, fontFamily: "Poppins")),

    onPressed:  () {
    ReportUI.goUserTabs(context);
    }),
          ],
        ),
      ),
    );
  }

}
