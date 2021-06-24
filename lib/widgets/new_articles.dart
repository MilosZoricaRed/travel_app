import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:provider/provider.dart';

class NewArticles extends StatefulWidget {
  const NewArticles({Key? key}) : super(key: key);

  @override
  _NewArticlesState createState() => _NewArticlesState();
}

class _NewArticlesState extends State<NewArticles> {
  ScrollController controller = ScrollController();

  var widthOfItem = 88;

  void nothing() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    controller.hasClients
        ? controller.animateTo(provider.currentIndex * widthOfItem.toDouble(),
            duration: Duration(seconds: 1), curve: Curves.ease)
        : nothing();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 122,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "New Articles",
                style: TextStyle(
                  color: Color(0xff321F0E),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: ListView.builder(
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index == provider.currentIndex
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 6,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  (Radius.circular(14)),
                                ),
                              ),
                              child: Container(
                                  height: 88,
                                  width: 76,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(provider.images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      (Radius.circular(14)),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff4D4945).withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 14,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Text(
                                          provider.names[index],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 14,
                              bottom: 6,
                            ),
                            child: Container(
                                height: 80,
                                width: 76,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(provider.images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    (Radius.circular(14)),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xff4D4945).withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 14,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Text(
                                        provider.names[index],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
