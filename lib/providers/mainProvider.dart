import 'dart:async';

import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier {
  int currentIndex = 1;

  bool drag = false;
  bool readNow = false;
  Timer? timer;

  readNowFunc() {
    if (timer == null) {
      readNow = true;
      notifyListeners();
      timer = new Timer(Duration(seconds: 4), () {
        readNow = false;
        notifyListeners();
        timer!.cancel();
      });
    } else {
      timer!.cancel();
      readNow = true;
      timer = new Timer(Duration(seconds: 4), () {
        readNow = false;
        notifyListeners();
        timer!.cancel();
      });
    }
  }

  var images = [
    'assets/images/Right 4 Card Small BG.png',
    'assets/images/Main Card BG.png',
    'assets/images/Right 1 Card Small BG.png',
    'assets/images/Right 2 Card Small BG.png',
    'assets/images/Right 3 Card Small BG.png',
  ];
  var names = ['China', 'Africa', 'Turkey', 'Italy', 'West'];

  var tags = [
    'All',
    'Overview',
    'Hotels',
    'Food',
    'Memes',
  ];

  bool tagTogle = false;
  
  var currImage;
  getCurrentImage(img) {
    currImage = img;
    notifyListeners();
  }

// increment and decremen of carousel index so i can get it in evry widget
  changeCurrentIndexForCarousel(index) {
    currentIndex = index;
    notifyListeners();
    // print(currentIndex.toString());
  }
}
