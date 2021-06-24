import 'package:flutter/material.dart';
import 'package:travel_dribbble/style/style.dart' as Style;

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/Avatar.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.mainBackgroundColor,
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    "WELCOME BACK",
                    style: TextStyle(
                      color: Color(0xff321F0E),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Ariana Grinder",
                    style: TextStyle(
                      color: Color(0xff321F0E),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
