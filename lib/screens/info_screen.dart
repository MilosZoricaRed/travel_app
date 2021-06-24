import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:travel_dribbble/widgets/tags_widget.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key, this.img}) : super(key: key);

  final img;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  print(details.toString());
                  Navigator.of(context).pop();
                },
                child: Hero(
                  tag: 'imageHero',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(this.widget.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 40,
                                width: 81,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/Arrow - Left.svg"),
                                    Text(
                                      "Back",
                                      style: TextStyle(
                                        color: Color(0xff132D2F),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          height: 44,
                                          width: 44,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/images/Heart.svg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 38,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            child: TagsWidget(ind: index),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "At First",
                                style: TextStyle(
                                  color: Color(0xff132D2F),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Let's figure out how much I spent on this trip of money and time, and then the story begins.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff081414).withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 140,
                      bottom: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: Color(0xff132D2F).withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "China",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff132D2F).withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xff132D2F).withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "China",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff132D2F).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_rounded,
                              color: Color(0xff132D2F).withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "1123 view",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff132D2F).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: provider.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                provider.images[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              bottom: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Price \$55 night",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
