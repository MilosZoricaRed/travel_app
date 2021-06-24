import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:provider/provider.dart';
import 'package:travel_dribbble/screens/info_screen.dart';

class BigCarousel extends StatefulWidget {
  const BigCarousel({Key? key}) : super(key: key);

  @override
  _BigCarouselState createState() => _BigCarouselState();
}

class _BigCarouselState extends State<BigCarousel> {
  PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true, initialPage: 1);
  int _current = 1;
  var _currentDragCard;
  List imgList = [
    'assets/images/Right 4 Card Small BG.png',
    'assets/images/Main Card BG.png',
    'assets/images/eab2fe5d99e2c560bd47b42b8c95ae9b.png',
    'assets/images/italy.png',
    'assets/images/PIC.png',
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _current = controller.page!.toInt();
      });
    });
    print((_current + 1).toString());
    print("object");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 185,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xffFECA2F),
                      Color(0xffFB8D27),
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(39),
                    topRight: Radius.circular(39)),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Container(
              height: 56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffFC8E12),
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffF70000).withOpacity(0.16),
                    spreadRadius: 0,
                    blurRadius: 19,
                    offset: Offset(-2, 10), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(300),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.explore_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 44,
                        child: Icon(
                          Icons.star_rounded,
                          color: Color(0xff200E32).withOpacity(0.3),
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 44,
                        child: Icon(
                          Icons.person,
                          color: Color(0xff200E32).withOpacity(0.3),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.9,
            child: CarouselSlider.builder(
                options: CarouselOptions(
                  pageSnapping: true,
                  viewportFraction: 0.75,
                  initialPage: 1,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  reverse: false,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, _) {
                    setState(() {
                      provider.changeCurrentIndexForCarousel(index);
                      _current = index;
                    });
                  },
                ),
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index, int ee) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return InfoScreen(img: imgList[index]);
                      }));
                    },
                    onVerticalDragStart: (details) {
                      setState(() {
                        provider.drag = true;
                        provider.readNowFunc();
                        _currentDragCard = index;
                        provider.getCurrentImage(imgList[index]);
                      });
                    },
                    onVerticalDragEnd: (details) {
                      setState(() {
                        provider.drag = false;
                      });
                    },
                    child: _current == index
                        ? Hero(
                            tag: 'imageHero',
                            child: FractionallySizedBox(
                              heightFactor: 0.9,
                              alignment: Alignment.topCenter,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 200),
                                    left: 0,
                                    right: 0,
                                    bottom: provider.drag && _current == index
                                        ? 0
                                        : 10,
                                    top: provider.drag && _current == index
                                        ? 10
                                        : 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.4,
                                      // height: MediaQuery.of(context).size.height / 2,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 20),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(imgList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          (Radius.circular(14)),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xff00000)
                                                .withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 14,
                                            offset: Offset(0,
                                                14), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 24),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Travel to Africa",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                "My trip to China started in Bejing, where i stayed in a beautiful hotel called...",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    width: 17,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/Avatar.png'),
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    "Leslie Alexander",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  provider.readNow == true &&
                                          _currentDragCard == index
                                      ? Positioned(
                                          top: 25,
                                          left: 10,
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Added in Read List.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          )
                        : FractionallySizedBox(
                            heightFactor: 0.9,
                            alignment: Alignment.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 200),
                                  left: 0,
                                  right: 0,
                                  bottom: provider.drag && _current == index
                                      ? 0
                                      : 10,
                                  top: provider.drag && _current == index
                                      ? 10
                                      : 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    // height: MediaQuery.of(context).size.height / 2,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(imgList[index]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        (Radius.circular(14)),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color(0xff00000).withOpacity(0.1),
                                          spreadRadius: 0,
                                          blurRadius: 14,
                                          offset: Offset(0,
                                              14), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Travel to Africa",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "My trip to China started in Bejing, where i stayed in a beautiful hotel called...",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 17,
                                                width: 17,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Avatar.png'),
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Leslie Alexander",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                provider.readNow == true &&
                                        _currentDragCard == index
                                    ? Positioned(
                                        top: 25,
                                        left: 10,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Added in Read List.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
