import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFAE5D2),
                borderRadius: BorderRadius.all(
                  (Radius.circular(12)),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xffEDA47E),
                  ),
                  hintText: "Search country or list",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEDA47E),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 8,
                    bottom: 12,
                    top: 12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFAE5D2),
                borderRadius: BorderRadius.all(
                  (Radius.circular(12)),
                ),
              ),
              child: Center(
                child: SvgPicture.asset("assets/images/Filter.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
