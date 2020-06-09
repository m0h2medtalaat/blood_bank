import 'package:flutter/material.dart';
import 'package:bloodbank/utilities/slider_data.dart';
import 'package:bloodbank/screens/login_screen.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<SliderModel> mySlides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 20.0 : 10.0,
      width: isCurrentPage ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFD5352C) : Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySlides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySlides[0].getImageAssetPath(),
                  desc: mySlides[0].getDesc(),
                ),
                SlideTile(
                  imagePath: mySlides[1].getImageAssetPath(),
                  desc: mySlides[1].getDesc(),
                ),
                SlideTile(
                  imagePath: mySlides[2].getImageAssetPath(),
                  desc: mySlides[2].getDesc(),
                )
              ],
            ),
          ),
          bottomSheet: Container(
            padding: EdgeInsets.only(left: 10.0),
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      slideIndex == 0
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                      SizedBox(
                        width: 5.0,
                      ),
                      slideIndex == 1
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                      SizedBox(
                        width: 5.0,
                      ),
                      slideIndex == 2
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                    ],
                  ),
                ),
                slideIndex != 2
                    ? FlatButton(
                        onPressed: () {
                          print("this is slideIndex: $slideIndex");
                          controller.animateToPage(slideIndex + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        splashColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.chevron_right,
                            size: 75.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        splashColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.check,
                            size: 75.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, desc;

  SlideTile({this.imagePath, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 1,
            child: Text(desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xFF946986))),
          )
        ],
      ),
    );
  }
}
