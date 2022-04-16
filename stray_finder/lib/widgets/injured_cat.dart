import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../managers/InjuryMngr.dart';
import '../screens/cat_map.dart';
class InjuredCatCard extends StatelessWidget{
  Map<String, dynamic> cat;
  PageController pageViewController = PageController(initialPage: 0);
  InjuredCatCard(this.cat);

  void goCatDetail(BuildContext context){ // line 144
    Navigator.of(context).pushNamed(
      CatDetailScreen.routeName,
      arguments: cat,
    );
  }
  @override
  Widget build(BuildContext context) {
    List<String> urls = [];
    cat['injury_img'].forEach((url)=> urls.add(url.toString()));
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
                    cat['cat_name'],
                    textAlign: TextAlign.center,
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
                            children: urls.map((url) => 
                              Image.network(
                                url,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )).toList(),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: 
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: SmoothPageIndicator(
                                controller: pageViewController,
                                count: urls.length,
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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: ()=>goCatDetail(context), 
                          icon: Icon(Icons.location_on, color: Theme.of(context).colorScheme.secondary, size:20), 
                          label: const Text(
                            "Location Tracker", 
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF754E46),
                            )
                          ),
                        ),
                        Padding(
                          padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                          child: Row(
                            children: [
                              Text("Contact: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              Text(cat['passerby_hp'], style: Theme.of(context).textTheme.subtitle1),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                          child: Text("Condition: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),

                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: Text(cat['injury_desc'], style: Theme.of(context).textTheme.subtitle1),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: 
                              EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff754E46)),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(30, 0, 30, 0)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                                ),
                              ),
                              child: Text(
                                "Handled",
                                  style: TextStyle(
                                    backgroundColor: Theme.of(context).colorScheme.secondary,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                              ),
                              // onPressed: () => remove(cat.id),
                              onPressed: (){
                                InjuryMngr.deleteInjury(cat['cat_id']);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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