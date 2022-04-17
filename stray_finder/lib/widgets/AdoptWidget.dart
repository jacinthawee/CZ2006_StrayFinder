import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../classes/AdoptOrg.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget to show a single adoption centre
class AdoptWidget extends StatelessWidget{
  /// the adopt center to show
  AdoptOrg adopt;
  /// a controller that allows multiple pictures to be scrollable
  PageController pageViewController = PageController(initialPage: 0);

  /// construtor of the class
  AdoptWidget(this.adopt);

  /// build the widget
  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                  child: Text(
                    adopt.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "Poppins"
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        children: [
                          PageView(
                            controller: pageViewController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Image.asset(
                                adopt.pic1Path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                adopt.pic2Path,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                adopt.pic3Path,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: SmoothPageIndicator(
                                controller: pageViewController,
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  pageViewController.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  spacing: 8,
                                  radius: 8,
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  dotColor: Color(0xFF9E9E9E),
                                  activeDotColor: Theme.of(context).primaryColor,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Text(
                          'Contact: ' ,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                        child: Text(
                          adopt.contact,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Text(
                          'Email: ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                        child: Text(
                          adopt.email,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Text(
                          'Address: ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                        child: Text(
                          adopt.address,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Text(
                          'Opening Hours: ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                        child: Text(
                          adopt.openinghours,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Text(
                          'Adoption Fee: ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                        child: Text(
                          adopt.fee,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins"
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional(-1, 0),
                      //   child: Padding(
                      //     padding:
                      //     EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      //     child:TextButton(
                      //       style: ButtonStyle(
                      //           foregroundColor:
                      //           MaterialStateProperty.all<Color>(Colors.white),
                      //           backgroundColor:
                      //           MaterialStateProperty.all<Color>(Color(0xff754E46)),
                      //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //               EdgeInsets.fromLTRB(70, 10, 70, 10)),
                      //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //               RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(50.0)))),
                      //       child: Text('Navigate',
                      //           style: TextStyle(fontSize: 15, fontFamily: "Poppins")),
                      //
                      //       onPressed: () {}),
                      //   ),
                      // ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                            child: Text(
                              'Website: ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.open_in_new_rounded,
                                  color: Color(0xFF754E46),
                                  size: 20,
                                ),
                                onPressed: goWebsite,
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  /// a method to lauch website of the adoption centre
  void goWebsite() async{
    var url = adopt.website;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
