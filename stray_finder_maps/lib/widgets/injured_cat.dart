import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../classes/stray_cat.dart';
import '../screens/cat_map.dart';
class InjuredCatCard extends StatelessWidget{
  StrayCat cat;
  Function remove;
  PageController pageViewController = PageController(initialPage: 0);
  InjuredCatCard(this.cat, this.remove);

  void goCatDetail(BuildContext context){ // line 144
    Navigator.of(context).pushNamed(
      CatDetailScreen.routeName,
      arguments: cat.id,
    );
  }
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
                    cat.name,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: 
                              EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                            child: Text(
                              'Location Tracker',
                              style: Theme.of(context).textTheme.bodyText1,
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
                              onPressed: () {
                                  // go to detailed page
                                  // print('IconButton pressed ...');
                                goCatDetail(context);
                              },
                            )
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Text(
                          'Contact: ' + cat.contact,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Text(
                          'Condition: ' + cat.condition,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: 
                            EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: TextButton(
                            child: Text(
                              "Handled",
                                style: TextStyle(
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                            ),
                            onPressed: () => remove(cat.id),
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
    );
  }
}