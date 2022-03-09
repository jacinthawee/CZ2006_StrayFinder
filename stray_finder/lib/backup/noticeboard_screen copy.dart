import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NoticeboardWidget extends StatefulWidget {
  // const NoticeboardWidget({Key key}) : super(key: key);

  @override
  _NoticeboardWidgetState createState() => _NoticeboardWidgetState();
}

class _NoticeboardWidgetState extends State<NoticeboardWidget> {
  PageController pageViewController1 = PageController(initialPage: 0);
  PageController pageViewController2 = PageController(initialPage: 0);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              elevation: 6,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
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
                              EdgeInsetsDirectional.fromSTEB(10, 0, 200, 5),
                          child: Text(
                            'Betty',
                            style: Theme.of(context).textTheme.headline4,
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
                                EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Stack(
                                children: [
                                  PageView(
                                    controller: pageViewController1 =
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/images/img1.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        'https://picsum.photos/seed/903/600',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        'https://picsum.photos/seed/120/600',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: SmoothPageIndicator(
                                        controller: pageViewController1,
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          pageViewController1.animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
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
                                          activeDotColor:
                                              Theme.of(context)
                                                  .primaryColor,
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
                          decoration: BoxDecoration(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 5),
                                    child: Text(
                                      'Location Tracker',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.7, 0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.open_in_new_rounded,
                                        color: Color(0xFF754E46),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    )
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: Text(
                                  'Contact: 98765432',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: Text(
                                  'Condition: xxxxxxxxxxxxxxxxxx',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: TextButton(
                                    child: Text(
                                      "Handle",
                                      style: TextStyle(
                                        backgroundColor: Theme.of(context).colorScheme.secondary,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                    ),
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Card(
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   color: Color(0xFFF5F5F5),
            //   elevation: 6,
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Color(0xFFEEEEEE),
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.max,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Padding(
            //               padding:
            //                   EdgeInsetsDirectional.fromSTEB(10, 0, 200, 5),
            //               child: Text(
            //                 'Benson',
            //                 style: FlutterFlowTheme.of(context).title3,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           mainAxisSize: MainAxisSize.max,
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Expanded(
            //               child: Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
            //                 child: Container(
            //                   width: MediaQuery.of(context).size.width * 0.4,
            //                   height: MediaQuery.of(context).size.height * 0.2,
            //                   child: Stack(
            //                     children: [
            //                       PageView(
            //                         controller: pageViewController2,
            //                         scrollDirection: Axis.horizontal,
            //                         children: [
            //                           Image.asset(
            //                             'assets/images/img2.png',
            //                             width: double.infinity,
            //                             height: double.infinity,
            //                             fit: BoxFit.cover,
            //                           ),
            //                           Image.network(
            //                             'https://picsum.photos/seed/903/600',
            //                             width: 100,
            //                             height: 100,
            //                             fit: BoxFit.cover,
            //                           ),
            //                           Image.network(
            //                             'https://picsum.photos/seed/120/600',
            //                             width: 100,
            //                             height: 100,
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ],
            //                       ),
            //                       Align(
            //                         alignment: AlignmentDirectional(0, 1),
            //                         child: Padding(
            //                           padding: EdgeInsetsDirectional.fromSTEB(
            //                               0, 0, 0, 10),
            //                           child: SmoothPageIndicator(
            //                             controller: pageViewController2 ??=
            //                                 PageController(initialPage: 0),
            //                             count: 3,
            //                             axisDirection: Axis.horizontal,
            //                             onDotClicked: (i) {
            //                               pageViewController2.animateToPage(
            //                                 i,
            //                                 duration:
            //                                     Duration(milliseconds: 500),
            //                                 curve: Curves.ease,
            //                               );
            //                             },
            //                             effect: ExpandingDotsEffect(
            //                               expansionFactor: 2,
            //                               spacing: 8,
            //                               radius: 8,
            //                               dotWidth: 8,
            //                               dotHeight: 8,
            //                               dotColor: Color(0xFF9E9E9E),
            //                               activeDotColor:
            //                                   FlutterFlowTheme.of(context)
            //                                       .primaryColor,
            //                               paintStyle: PaintingStyle.fill,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               width: MediaQuery.of(context).size.width * 0.5,
            //               decoration: BoxDecoration(
            //                 color: Color(0xFFEEEEEE),
            //               ),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.max,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Row(
            //                     mainAxisSize: MainAxisSize.max,
            //                     children: [
            //                       Padding(
            //                         padding: EdgeInsetsDirectional.fromSTEB(
            //                             5, 5, 0, 5),
            //                         child: Text(
            //                           'Location Tracker',
            //                           style: FlutterFlowTheme.of(context)
            //                               .bodyText1,
            //                         ),
            //                       ),
            //                       Align(
            //                         alignment: AlignmentDirectional(0.7, 0),
            //                         child: FlutterFlowIconButton(
            //                           borderColor: Colors.transparent,
            //                           borderRadius: 10,
            //                           borderWidth: 1,
            //                           buttonSize: 40,
            //                           icon: Icon(
            //                             Icons.open_in_new_rounded,
            //                             color: Color(0xFF754E46),
            //                             size: 20,
            //                           ),
            //                           onPressed: () {
            //                             print('IconButton pressed ...');
            //                           },
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   Padding(
            //                     padding:
            //                         EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            //                     child: Text(
            //                       'Contact: 81234567',
            //                       style: FlutterFlowTheme.of(context).bodyText1,
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding:
            //                         EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            //                     child: Text(
            //                       'Condition: xxxxxxxxxxxxxxxxxx',
            //                       style: FlutterFlowTheme.of(context).bodyText1,
            //                     ),
            //                   ),
            //                   Align(
            //                     alignment: AlignmentDirectional(-1, 0),
            //                     child: Padding(
            //                       padding: EdgeInsetsDirectional.fromSTEB(
            //                           5, 5, 5, 5),
            //                       child: FFButtonWidget(
            //                         onPressed: () {
            //                           print('Button pressed ...');
            //                         },
            //                         text: 'Handle',
            //                         options: FFButtonOptions(
            //                           width: 80,
            //                           height: 25,
            //                           color: FlutterFlowTheme.of(context)
            //                               .secondaryColor,
            //                           textStyle: FlutterFlowTheme.of(context)
            //                               .subtitle2
            //                               .override(
            //                                 fontFamily: 'Poppins',
            //                                 color: Colors.white,
            //                                 fontSize: 14,
            //                               ),
            //                           elevation: 4,
            //                           borderSide: BorderSide(
            //                             color: Colors.transparent,
            //                             width: 1,
            //                           ),
            //                           borderRadius: 12,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
