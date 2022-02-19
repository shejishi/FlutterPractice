import 'package:flutter/material.dart';

import '../introducation_animation/IntroductionAnimationScreen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  String imagePath;
  Widget? navigateScreen;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: const IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
    ),
  ];
}
