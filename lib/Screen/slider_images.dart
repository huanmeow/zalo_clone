import 'dart:async';
import 'package:flutter/material.dart';

class AutoSlideshow extends StatefulWidget {
  @override
  _AutoSlideshowState createState() => _AutoSlideshowState();
}

class _AutoSlideshowState extends State<AutoSlideshow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> images = [
    "images/Wel/wc1.png",
    "images/Wel/wc2.png",
    "images/Wel/wc3.png",
    "images/Wel/wc4.png",
    "images/Wel/wc5.png",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
          ),
        ),
      ),
    );
  }
}
