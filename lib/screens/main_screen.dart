import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_dribbble/providers/mainProvider.dart';
import 'package:travel_dribbble/style/style.dart' as Style;
import 'package:travel_dribbble/widgets/big_carousel.dart';
import 'package:travel_dribbble/widgets/new_articles.dart';
import 'package:travel_dribbble/widgets/profile_widget.dart';
import 'package:travel_dribbble/widgets/read_now.dart';
import 'package:travel_dribbble/widgets/search.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
    final provider = context.watch<MainProvider>();
    return Scaffold(
      backgroundColor: Color(0xffFB8D27),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Style.mainBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: provider.readNow == true ? 32 : 48, left: 20, right: 20),
                child: provider.readNow == true ? ReadNowWidget() : ProfileWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: NewArticles(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: SearchWidget(),
              ),
              BigCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
