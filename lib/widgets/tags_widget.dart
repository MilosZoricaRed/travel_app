import 'package:flutter/material.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:provider/provider.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, this.ind}) : super(key: key);
  final ind;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return ind == 0
        ? Container(
            decoration: BoxDecoration(
              color: Color(0xff132D2F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: Center(
                child: Text(
                  provider.tags[ind],
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: Color(0xffFBFCF9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: Center(
                child: Text(
                  provider.tags[ind],
                  style: TextStyle(
                      color: Color(0xff132D2F),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          );
  }
}
