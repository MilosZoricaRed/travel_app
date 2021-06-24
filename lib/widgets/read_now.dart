import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:provider/provider.dart';

class ReadNowWidget extends StatefulWidget {
  const ReadNowWidget({Key? key}) : super(key: key);

  @override
  _ReadNowWidgetState createState() => _ReadNowWidgetState();
}

class _ReadNowWidgetState extends State<ReadNowWidget>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<Offset>(begin: Offset(0, 0.4), end: Offset(0, -0.0))
        .animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.linearToEaseOut,
    ));
    _animationController!.forward().whenComplete(() {
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return SlideTransition(
      position: _animation!,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            (Radius.circular(16)),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff4D4945).withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 64,
              offset: Offset(0, 14), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(provider.currImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    (Radius.circular(12)),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Travel to Africa",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff321F0E)),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 13,
                      color: Color(0xffFC8E12),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Added in Read List",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFC8E12),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Read Now",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff321F0E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
